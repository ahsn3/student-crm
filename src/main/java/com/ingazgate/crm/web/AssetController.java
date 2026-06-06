package com.ingazgate.crm.web;

import com.ingazgate.crm.asset.Department;
import com.ingazgate.crm.asset.DepartmentRepository;
import com.ingazgate.crm.asset.University;
import com.ingazgate.crm.asset.UniversityRepository;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URI;
import java.time.OffsetDateTime;
import java.util.Base64;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AssetController {
  private final UniversityRepository universityRepository;
  private final DepartmentRepository departmentRepository;
  private final ProgramsCatalogService programsCatalog;
  private final UniversitiesCatalogService universitiesCatalog;

  public AssetController(
      UniversityRepository universityRepository,
      DepartmentRepository departmentRepository,
      ProgramsCatalogService programsCatalog,
      UniversitiesCatalogService universitiesCatalog) {
    this.universityRepository = universityRepository;
    this.departmentRepository = departmentRepository;
    this.programsCatalog = programsCatalog;
    this.universitiesCatalog = universitiesCatalog;
  }

  @PostMapping("/universities")
  String addUniversity(
      @RequestParam("name") String name,
      @RequestParam(value = "country", required = false) String country,
      @RequestParam(value = "website", required = false) String website,
      @RequestParam(value = "currency", required = false) String currency,
      @RequestParam(value = "programsCount", required = false) String programsCount,
      @RequestParam(value = "campusesCount", required = false) String campusesCount,
      @RequestParam(value = "logoUrl", required = false) String logoUrl,
      @RequestParam(value = "logoFile", required = false) MultipartFile logoFile,
      RedirectAttributes redirectAttributes) {
    String normalizedName = normalize(name);
    if (normalizedName.isEmpty()) {
      redirectAttributes.addFlashAttribute("universityError", "University name is required.");
      return "redirect:/universities";
    }

    University university = new University();
    university.setId(UUID.randomUUID());
    university.setName(normalizedName);
    university.setCountry(emptyToNull(normalize(country)));
    university.setWebsite(emptyToNull(normalize(website)));
    university.setCurrency(emptyToNull(normalize(currency)));
    university.setProgramsCount(parseOptionalInt(programsCount));
    university.setCampusesCount(parseOptionalInt(campusesCount));
    university.setLogoUrl(resolveUniversityLogo(logoUrl, logoFile, university.getWebsite(), redirectAttributes));
    if (redirectAttributes.getFlashAttributes().containsKey("universityError")) {
      return "redirect:/universities";
    }
    university.setCreatedAt(OffsetDateTime.now());
    universityRepository.save(university);
    universitiesCatalog.invalidate();

    redirectAttributes.addFlashAttribute("universitySuccess", "University added.");
    return "redirect:/universities";
  }

  @PostMapping("/universities/{id}/logo")
  String updateUniversityLogo(
      @PathVariable UUID id,
      @RequestParam(value = "logoUrl", required = false) String logoUrl,
      @RequestParam(value = "logoFile", required = false) MultipartFile logoFile,
      RedirectAttributes redirectAttributes) {
    University university =
        universityRepository
            .findById(id)
            .orElseThrow(() -> new IllegalArgumentException("University not found."));
    String resolved = resolveUniversityLogo(logoUrl, logoFile, university.getWebsite(), redirectAttributes);
    if (redirectAttributes.getFlashAttributes().containsKey("universityError")) {
      return "redirect:/universities/" + id;
    }
    university.setLogoUrl(resolved);
    universityRepository.save(university);
    redirectAttributes.addFlashAttribute("universitySuccess", "University logo updated.");
    return "redirect:/universities/" + id;
  }

  @PostMapping("/departments")
  String addDepartment(
      @RequestParam("name") String name,
      @RequestParam("universityId") UUID universityId,
      @RequestParam(value = "nameAr", required = false) String nameAr,
      @RequestParam(value = "degree", required = false) String degree,
      @RequestParam(value = "language", required = false) String language,
      @RequestParam(value = "beforeDiscount", required = false) String beforeDiscount,
      @RequestParam(value = "cost", required = false) String cost,
      @RequestParam(value = "cashPrice", required = false) String cashPrice,
      @RequestParam(value = "years", required = false) String years,
      @RequestParam(value = "available", required = false) String availableParam,
      RedirectAttributes redirectAttributes) {
    String normalizedName = normalize(name);
    if (normalizedName.isEmpty()) {
      redirectAttributes.addFlashAttribute("departmentError", "Department name is required.");
      return "redirect:/programs";
    }

    University university =
        universityRepository
            .findById(universityId)
            .orElseThrow(() -> new IllegalArgumentException("University not found."));

    String deg = emptyToNull(normalize(degree));
    String lang = emptyToNull(normalize(language));
    if (departmentRepository.existsDuplicateForUniversity(
        universityId, normalizedName, deg != null ? deg : "", lang != null ? lang : "")) {
      redirectAttributes.addFlashAttribute(
          "departmentError",
          "A program with the same name, degree, and language already exists for this university.");
      return "redirect:/programs";
    }

    OffsetDateTime now = OffsetDateTime.now();
    Department department = new Department();
    department.setId(UUID.randomUUID());
    department.setName(normalizedName);
    department.setNameAr(emptyToNull(normalize(nameAr)));
    department.setDegree(emptyToNull(normalize(degree)));
    department.setLanguage(emptyToNull(normalize(language)));
    department.setBeforeDiscount(parseOptionalDecimal(beforeDiscount));
    department.setCost(parseOptionalDecimal(cost));
    department.setCashPrice(parseOptionalDecimal(cashPrice));
    department.setYears(parseOptionalInt(years));
    department.setAvailable(availableParam != null);
    department.setUniversity(university);
    department.setCreatedAt(now);
    department.setUpdatedAt(now);
    departmentRepository.save(department);
    programsCatalog.invalidate();

    redirectAttributes.addFlashAttribute("departmentSuccess", "Department added.");
    return "redirect:/programs";
  }

  @PostMapping("/departments/{id}/update")
  String updateDepartment(
      @PathVariable("id") UUID id,
      @RequestParam("name") String name,
      @RequestParam("universityId") UUID universityId,
      @RequestParam(value = "nameAr", required = false) String nameAr,
      @RequestParam(value = "degree", required = false) String degree,
      @RequestParam(value = "language", required = false) String language,
      @RequestParam(value = "beforeDiscount", required = false) String beforeDiscount,
      @RequestParam(value = "cost", required = false) String cost,
      @RequestParam(value = "cashPrice", required = false) String cashPrice,
      @RequestParam(value = "years", required = false) String years,
      @RequestParam(value = "available", required = false) String availableParam,
      RedirectAttributes redirectAttributes) {
    String normalizedName = normalize(name);
    if (normalizedName.isEmpty()) {
      redirectAttributes.addFlashAttribute("departmentError", "Department name is required.");
      return "redirect:/programs";
    }

    Department department =
        departmentRepository
            .findById(id)
            .orElseThrow(() -> new IllegalArgumentException("Department not found."));
    University university =
        universityRepository
            .findById(universityId)
            .orElseThrow(() -> new IllegalArgumentException("University not found."));

    department.setName(normalizedName);
    department.setNameAr(emptyToNull(normalize(nameAr)));
    department.setDegree(emptyToNull(normalize(degree)));
    department.setLanguage(emptyToNull(normalize(language)));
    department.setBeforeDiscount(parseOptionalDecimal(beforeDiscount));
    department.setCost(parseOptionalDecimal(cost));
    department.setCashPrice(parseOptionalDecimal(cashPrice));
    department.setYears(parseOptionalInt(years));
    department.setAvailable(availableParam != null);
    department.setUniversity(university);
    department.setUpdatedAt(OffsetDateTime.now());
    departmentRepository.save(department);
    programsCatalog.invalidate();

    redirectAttributes.addFlashAttribute("departmentSuccess", "Program updated.");
    return "redirect:/programs";
  }

  @PostMapping("/departments/{id}/delete")
  String deleteDepartment(@PathVariable("id") UUID id, RedirectAttributes redirectAttributes) {
    if (departmentRepository.existsById(id)) {
      departmentRepository.deleteById(id);
      programsCatalog.invalidate();
      redirectAttributes.addFlashAttribute("departmentSuccess", "Program deleted.");
    }
    return "redirect:/programs";
  }

  private String normalize(String value) {
    return value == null ? "" : value.trim();
  }

  private static String emptyToNull(String value) {
    return value == null || value.isEmpty() ? null : value;
  }

  private static Integer parseOptionalInt(String raw) {
    if (raw == null || raw.isBlank()) {
      return null;
    }
    try {
      return Integer.parseInt(raw.trim());
    } catch (NumberFormatException e) {
      return null;
    }
  }

  private static BigDecimal parseOptionalDecimal(String raw) {
    if (raw == null || raw.isBlank()) {
      return null;
    }
    try {
      return new BigDecimal(raw.trim().replace(",", ""));
    } catch (NumberFormatException e) {
      return null;
    }
  }

  private String resolveUniversityLogo(
      String logoUrlParam,
      MultipartFile logoFile,
      String website,
      RedirectAttributes redirectAttributes) {
    String fromFile = logoDataUriFromFile(logoFile, redirectAttributes);
    if (fromFile != null) {
      return fromFile;
    }
    String logo = emptyToNull(normalize(logoUrlParam));
    if (logo != null) {
      return logo;
    }
    return faviconFromWebsite(website);
  }

  private static String logoDataUriFromFile(MultipartFile file, RedirectAttributes redirectAttributes) {
    if (file == null || file.isEmpty()) {
      return null;
    }
    String contentType = file.getContentType();
    if (contentType == null
        || (!contentType.equalsIgnoreCase("image/png")
            && !contentType.equalsIgnoreCase("image/jpeg")
            && !contentType.equalsIgnoreCase("image/jpg")
            && !contentType.equalsIgnoreCase("image/webp"))) {
      redirectAttributes.addFlashAttribute(
          "universityError", "Logo must be PNG, JPG, or WEBP (max 1 MB).");
      return null;
    }
    if (file.getSize() > 1024L * 1024L) {
      redirectAttributes.addFlashAttribute("universityError", "Logo must be 1 MB or smaller.");
      return null;
    }
    try {
      byte[] png = rasterLogoToPng(file.getBytes());
      if (png == null) {
        redirectAttributes.addFlashAttribute("universityError", "Could not read logo file.");
        return null;
      }
      return "data:image/png;base64," + Base64.getEncoder().encodeToString(png);
    } catch (Exception ex) {
      redirectAttributes.addFlashAttribute("universityError", "Could not read logo file.");
      return null;
    }
  }

  private static byte[] rasterLogoToPng(byte[] data) throws IOException {
    BufferedImage bi = ImageIO.read(new ByteArrayInputStream(data));
    if (bi == null) {
      return null;
    }
    int w = bi.getWidth();
    int h = bi.getHeight();
    if (w <= 0 || h <= 0) {
      return null;
    }
    BufferedImage rgb = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
    Graphics2D g = rgb.createGraphics();
    g.setColor(Color.WHITE);
    g.fillRect(0, 0, w, h);
    g.drawImage(bi, 0, 0, null);
    g.dispose();
    ByteArrayOutputStream out = new ByteArrayOutputStream();
    ImageIO.write(rgb, "png", out);
    return out.toByteArray();
  }

  private static String faviconFromWebsite(String website) {
    if (website == null || website.isBlank()) {
      return null;
    }
    try {
      String href = website.contains("://") ? website : "https://" + website;
      URI uri = URI.create(href);
      String host = uri.getHost();
      if (host == null || host.isBlank()) {
        return null;
      }
      return "https://www.google.com/s2/favicons?domain=" + host + "&sz=128";
    } catch (IllegalArgumentException e) {
      return null;
    }
  }
}
