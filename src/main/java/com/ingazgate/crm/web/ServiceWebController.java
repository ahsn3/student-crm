package com.ingazgate.crm.web;

import com.ingazgate.crm.student.Student;
import com.ingazgate.crm.student.StudentRepository;
import com.ingazgate.crm.student.StudentServiceRecord;
import com.ingazgate.crm.student.StudentServiceRecordRepository;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import com.ingazgate.crm.user.WorkspaceOwnershipService;
import java.security.Principal;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ServiceWebController {
  public static final String RESIDENCY_RENEWAL_KEY = "residency-renewal";
  private static final String AIRPORT_TRANSFER_KEY = "airport-transfer";
  private static final String BANK_ACCOUNT_KEY = "bank-account";
  private static final String HOUSING_KEY = "housing";
  private static final String EQUIVALENCY_KEY = "equivalency";

  private static final List<String> SERVICE_KEYS =
      List.of(
          RESIDENCY_RENEWAL_KEY,
          AIRPORT_TRANSFER_KEY,
          BANK_ACCOUNT_KEY,
          HOUSING_KEY,
          EQUIVALENCY_KEY);
  private static final List<ServiceCard> SERVICE_CARDS =
      List.of(
          new ServiceCard(
              RESIDENCY_RENEWAL_KEY,
              "services.item.residencyRenewal.name",
              "services.item.residencyRenewal.details",
              "services.form.residencyEndDate",
              true),
          new ServiceCard(
              AIRPORT_TRANSFER_KEY,
              "services.item.airportTransfer.name",
              "services.item.airportTransfer.details",
              "services.form.airportDate",
              false),
          new ServiceCard(
              BANK_ACCOUNT_KEY,
              "services.item.bankAccount.name",
              "services.item.bankAccount.details",
              "services.form.bankServiceDate",
              false),
          new ServiceCard(
              HOUSING_KEY,
              "services.item.housing.name",
              "services.item.housing.details",
              "services.form.housingServiceDate",
              false),
          new ServiceCard(
              EQUIVALENCY_KEY,
              "services.item.equivalency.name",
              "services.item.equivalency.details",
              "services.form.equivalencyServiceDate",
              false));

  private final AuthUsers authUsers;
  private final AppUserRepository appUserRepository;
  private final StudentRepository studentRepository;
  private final StudentServiceRecordRepository studentServiceRecordRepository;
  private final WorkspaceOwnershipService workspaceOwnershipService;

  public ServiceWebController(
      AuthUsers authUsers,
      AppUserRepository appUserRepository,
      StudentRepository studentRepository,
      StudentServiceRecordRepository studentServiceRecordRepository,
      WorkspaceOwnershipService workspaceOwnershipService) {
    this.authUsers = authUsers;
    this.appUserRepository = appUserRepository;
    this.studentRepository = studentRepository;
    this.studentServiceRecordRepository = studentServiceRecordRepository;
    this.workspaceOwnershipService = workspaceOwnershipService;
  }

  @GetMapping("/services")
  String services(Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    UUID ownerId = workspaceOwnershipService.workspaceOwnerId(user);
    List<Student> students = studentRepository.findByOwnerUser_IdOrderByCreatedAtDesc(ownerId);
    Map<String, List<StudentServiceRecord>> recordsByService =
        SERVICE_KEYS.stream()
            .collect(
                Collectors.toMap(
                    key -> key,
                    key -> studentServiceRecordRepository.listForOwnerAndServiceKey(ownerId, key)));
    model.addAttribute("pageTitleKey", "page.services.title");
    model.addAttribute("activeNav", "services");
    model.addAttribute("students", students);
    model.addAttribute("serviceCards", SERVICE_CARDS);
    model.addAttribute("recordsByService", recordsByService);
    model.addAttribute(
        "residencyRecords",
        recordsByService.getOrDefault(RESIDENCY_RENEWAL_KEY, List.of()));
    model.addAttribute(
        "airportRecords", recordsByService.getOrDefault(AIRPORT_TRANSFER_KEY, List.of()));
    model.addAttribute(
        "bankRecords", recordsByService.getOrDefault(BANK_ACCOUNT_KEY, List.of()));
    model.addAttribute(
        "housingRecords", recordsByService.getOrDefault(HOUSING_KEY, List.of()));
    model.addAttribute(
        "equivalencyRecords", recordsByService.getOrDefault(EQUIVALENCY_KEY, List.of()));
    model.addAttribute("contentTemplate", "pages/services");
    return "layout/shell";
  }

  @GetMapping("/services/{serviceKey}")
  String serviceDetail(
      @PathVariable String serviceKey, Model model, Principal principal, RedirectAttributes ra) {
    if (!isValidServiceKey(serviceKey)) {
      ra.addFlashAttribute("serviceErrorKey", "services.flash.invalidInput");
      return "redirect:/services";
    }
    AppUser user = authUsers.requireCurrentUser(principal);
    UUID ownerId = workspaceOwnershipService.workspaceOwnerId(user);
    List<Student> students = studentRepository.findByOwnerUser_IdOrderByCreatedAtDesc(ownerId);
    List<StudentServiceRecord> records =
        studentServiceRecordRepository.listForOwnerAndServiceKey(ownerId, serviceKey);

    ServiceCard selectedService =
        SERVICE_CARDS.stream().filter(c -> c.key().equals(serviceKey)).findFirst().orElseThrow();
    model.addAttribute("pageTitleKey", "page.services.title");
    model.addAttribute("activeNav", "services");
    model.addAttribute("students", students);
    model.addAttribute("selectedService", selectedService);
    model.addAttribute("serviceRecords", records);
    model.addAttribute("contentTemplate", "pages/service-detail");
    return "layout/shell";
  }

  @PostMapping("/services")
  String saveService(
      Principal principal,
      @RequestParam(value = "serviceKey", required = false) String serviceKey,
      @RequestParam(value = "studentId", required = false) String studentIdParam,
      @RequestParam(value = "details", required = false) String details,
      @RequestParam(value = "endDate", required = false) String endDateParam,
      RedirectAttributes redirectAttributes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    UUID ownerId = workspaceOwnershipService.workspaceOwnerId(user);
    UUID studentId = parseUuid(studentIdParam);
    if (!isValidServiceKey(serviceKey) || studentId == null) {
      redirectAttributes.addFlashAttribute("serviceErrorKey", "services.flash.invalidInput");
      return "redirect:/services";
    }
    if (studentRepository.findByIdAndOwnerUser_Id(studentId, ownerId).isEmpty()) {
      redirectAttributes.addFlashAttribute("serviceErrorKey", "services.flash.studentInvalid");
      return "redirect:/services";
    }

    String normalizedDetails = clampDetails(details);
    if (normalizedDetails.isBlank()) {
      redirectAttributes.addFlashAttribute("serviceErrorKey", "services.flash.detailsRequired");
      return "redirect:/services";
    }

    LocalDate endDate = parseLocalDate(endDateParam);
    if (RESIDENCY_RENEWAL_KEY.equals(serviceKey) && endDate == null) {
      redirectAttributes.addFlashAttribute("serviceErrorKey", "services.flash.endDateRequired");
      return "redirect:/services";
    }

    OffsetDateTime now = OffsetDateTime.now();
    StudentServiceRecord row = new StudentServiceRecord();
    row.setId(UUID.randomUUID());
    row.setOwnerUser(appUserRepository.getReferenceById(ownerId));
    row.setStudent(studentRepository.getReferenceById(studentId));
    row.setServiceKey(serviceKey);
    row.setStatus("NEW");
    row.setDetails(normalizedDetails);
    row.setEndDate(RESIDENCY_RENEWAL_KEY.equals(serviceKey) ? endDate : null);
    row.setCreatedAt(now);
    row.setUpdatedAt(now);
    studentServiceRecordRepository.save(row);
    redirectAttributes.addFlashAttribute("serviceSuccessKey", "services.flash.saved");
    return "redirect:/services/" + serviceKey;
  }

  private static boolean isValidServiceKey(String key) {
    return SERVICE_KEYS.contains(key);
  }

  private static String clampDetails(String value) {
    if (value == null) return "";
    String normalized = value.trim().replace("\r\n", "\n");
    return normalized.length() > 4000 ? normalized.substring(0, 4000) : normalized;
  }

  private static UUID parseUuid(String value) {
    if (value == null || value.isBlank()) return null;
    try {
      return UUID.fromString(value.trim());
    } catch (IllegalArgumentException ex) {
      return null;
    }
  }

  private static LocalDate parseLocalDate(String value) {
    if (value == null || value.isBlank()) return null;
    try {
      return LocalDate.parse(value.trim());
    } catch (DateTimeException ex) {
      return null;
    }
  }

  public record ServiceCard(
      String key,
      String titleKey,
      String detailsKey,
      String dateLabelKey,
      boolean residencyEndRequired) {}
}
