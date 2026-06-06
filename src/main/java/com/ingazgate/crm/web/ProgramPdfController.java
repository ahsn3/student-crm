package com.ingazgate.crm.web;

import com.ingazgate.crm.asset.Department;
import com.ingazgate.crm.asset.DepartmentRepository;
import com.ingazgate.crm.pdf.ProgramPdfService;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import jakarta.validation.Valid;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ProgramPdfController {
  private static final Logger log = LoggerFactory.getLogger(ProgramPdfController.class);
  private static final int MAX_SELECTION_PDF = 40;

  private final DepartmentRepository departmentRepository;
  private final ProgramsCatalogService programsCatalog;
  private final ProgramPdfService programPdfService;
  private final String pdfCompanyName;
  private final AuthUsers authUsers;
  private final AppUserRepository appUserRepository;

  public ProgramPdfController(
      DepartmentRepository departmentRepository,
      ProgramsCatalogService programsCatalog,
      ProgramPdfService programPdfService,
      AuthUsers authUsers,
      AppUserRepository appUserRepository,
      @Value("${app.pdf.company-name}") String pdfCompanyName) {
    this.departmentRepository = departmentRepository;
    this.programsCatalog = programsCatalog;
    this.programPdfService = programPdfService;
    this.authUsers = authUsers;
    this.appUserRepository = appUserRepository;
    this.pdfCompanyName = pdfCompanyName;
  }

  private record PdfBranding(String companyName, byte[] logoBytes, String contactPhone) {}

  @PostMapping(value = "/departments/export-pdf", consumes = MediaType.APPLICATION_JSON_VALUE)
  ResponseEntity<byte[]> exportPdf(@Valid @RequestBody PdfExportRequest body, Principal principal) {
    List<UUID> programIds = body.programIds();
    if (programIds == null || programIds.isEmpty()) {
      return ResponseEntity.badRequest().build();
    }
    if (programIds.size() > MAX_SELECTION_PDF) {
      return ResponseEntity.badRequest().build();
    }

    List<Department> loaded = departmentRepository.findAllByIdInWithUniversity(programIds);
    Map<UUID, Department> byId = new LinkedHashMap<>();
    for (Department d : loaded) {
      byId.put(d.getId(), d);
    }

    List<Department> ordered = new ArrayList<>();
    for (UUID id : programIds) {
      Department d = byId.get(id);
      if (d != null) {
        ordered.add(d);
      }
    }
    if (ordered.isEmpty()) {
      return ResponseEntity.notFound().build();
    }

    String student =
        StringUtils.hasText(body.studentName()) ? body.studentName().trim() : "Student";
    return renderPdfResponse(principal, student, ordered, "programs");
  }

  @PostMapping(value = "/api/programs/export-pdf", consumes = MediaType.APPLICATION_JSON_VALUE)
  ResponseEntity<byte[]> exportFilteredPrograms(
      @Valid @RequestBody ProgramsCatalogPdfExportRequest body, Principal principal) {
    if (principal == null) {
      return ResponseEntity.status(403).build();
    }
    if (!authUsers.canManageAgents(authUsers.requireCurrentUser(principal))) {
      return ResponseEntity.status(403).build();
    }

    List<String> universities =
        body.university() == null
            ? List.of()
            : body.university().stream().filter(StringUtils::hasText).map(String::trim).toList();
    String search = body.search() == null ? "" : body.search().trim();
    String degree = body.degree() == null ? "" : body.degree().trim();
    String language = body.language() == null ? "" : body.language().trim();
    String country = body.country() == null ? "" : body.country().trim();

    long total = programsCatalog.countMatching(search, universities, degree, language, country);
    if (total == 0) {
      return ResponseEntity.notFound().build();
    }
    if (total > ProgramsCatalogService.MAX_PDF_EXPORT_ROWS) {
      return ResponseEntity.badRequest().build();
    }

    List<Department> programs =
        programsCatalog.searchAllForExport(search, universities, degree, language, country);
    if (programs.isEmpty()) {
      return ResponseEntity.notFound().build();
    }

    return renderCatalogPdfResponse(principal, programs, total);
  }

  private ResponseEntity<byte[]> renderCatalogPdfResponse(
      Principal principal, List<Department> programs, long total) {
    String company = StringUtils.hasText(pdfCompanyName) ? pdfCompanyName.trim() : "Student CRM";
    company = truncate(company, 120);

    byte[] pdf;
    try {
      // Always IngazGate branding logo from app assets — never agent/user logos.
      pdf = programPdfService.renderProgramCatalogTablePdf(company, programs, null, total);
    } catch (Exception e) {
      log.error("Catalog PDF export failed for {} programs", programs.size(), e);
      return ResponseEntity.internalServerError().build();
    }

    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_PDF);
    headers.add(
        HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"programs-catalog.pdf\"");

    return ResponseEntity.ok().headers(headers).body(pdf);
  }

  private ResponseEntity<byte[]> renderPdfResponse(
      Principal principal, String studentTitle, List<Department> programs, String filenamePrefix) {
    String student = StringUtils.hasText(studentTitle) ? studentTitle.trim() : "Programs";
    PdfBranding branding = resolvePdfBranding(principal);
    student = truncate(student, 120);
    String company = truncate(branding.companyName(), 120);

    byte[] pdf;
    try {
      pdf =
          programPdfService.renderProgramComparisonPdf(
              company, student, programs, branding.logoBytes(), branding.contactPhone());
    } catch (Exception e) {
      log.error("PDF export failed for {} programs", programs.size(), e);
      return ResponseEntity.internalServerError().build();
    }

    String safeStudent = student.replaceAll("[^a-zA-Z0-9._-]+", "-").replaceAll("^-+|-+$", "");
    if (safeStudent.isEmpty()) {
      safeStudent = "catalog";
    }
    String filename = filenamePrefix + "-" + safeStudent + ".pdf";

    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_PDF);
    headers.add(
        HttpHeaders.CONTENT_DISPOSITION,
        "attachment; filename=\"" + filename.replace("\"", "") + "\"");

    return ResponseEntity.ok().headers(headers).body(pdf);
  }

  /** Company/agent office branding for student PDFs — never an employee profile photo. */
  private PdfBranding resolvePdfBranding(Principal principal) {
    String defaultCompany =
        StringUtils.hasText(pdfCompanyName) ? pdfCompanyName.trim() : "Student CRM";
    if (principal == null) {
      return new PdfBranding(defaultCompany, null, null);
    }
    AppUser user = authUsers.requireCurrentUser(principal);
    if (authUsers.canManageAgents(user)) {
      return new PdfBranding(defaultCompany, null, null);
    }

    AppUser agent = resolveAgentForUser(user);
    if (agent != null) {
      return brandingForAgent(agent, defaultCompany);
    }

    if ("AGENT".equalsIgnoreCase(user.getRole())) {
      return brandingForAgent(user, defaultCompany);
    }

    String company =
        StringUtils.hasText(user.getOfficeName()) ? user.getOfficeName().trim() : defaultCompany;
    return new PdfBranding(company, null, trimContactPhone(user.getPhone()));
  }

  private static PdfBranding brandingForAgent(AppUser agent, String defaultCompany) {
    String company =
        StringUtils.hasText(agent.getOfficeName())
            ? agent.getOfficeName().trim()
            : (StringUtils.hasText(agent.getDisplayName())
                ? agent.getDisplayName().trim()
                : defaultCompany);
    return new PdfBranding(company, parseDataUriLogo(agent.getLogoUrl()), trimContactPhone(agent.getPhone()));
  }

  private static String trimContactPhone(String phone) {
    if (!StringUtils.hasText(phone)) {
      return null;
    }
    return phone.trim();
  }

  private AppUser resolveAgentForUser(AppUser user) {
    if (user.getParentUserId() != null) {
      return appUserRepository
          .findById(user.getParentUserId())
          .filter(u -> "AGENT".equalsIgnoreCase(u.getRole()))
          .orElse(null);
    }
    String domain = user.getEmailDomain();
    if (domain == null || domain.isBlank() || domain.equalsIgnoreCase("local")) {
      return null;
    }
    var agents = appUserRepository.findAgentsByEmailDomain(domain.trim());
    return agents.isEmpty() ? null : agents.get(0);
  }

  private static String truncate(String s, int max) {
    if (s.length() <= max) {
      return s;
    }
    return s.substring(0, max);
  }

  private static byte[] parseDataUriLogo(String raw) {
    if (!StringUtils.hasText(raw)) {
      return null;
    }
    String value = raw.trim();
    if (!value.startsWith("data:image/") || !value.contains(";base64,")) {
      return null;
    }
    int idx = value.indexOf(";base64,");
    if (idx < 0 || idx + 8 >= value.length()) {
      return null;
    }
    String b64 = value.substring(idx + 8);
    try {
      return Base64.getDecoder().decode(b64);
    } catch (IllegalArgumentException ex) {
      return null;
    }
  }
}
