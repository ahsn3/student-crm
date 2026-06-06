package com.ingazgate.crm.web;

import com.ingazgate.crm.student.ApplicationAttachment;
import com.ingazgate.crm.student.ApplicationAttachmentRepository;
import com.ingazgate.crm.student.ApplicationChatLine;
import com.ingazgate.crm.student.ApplicationChatService;
import com.ingazgate.crm.student.ApplicationMessage;
import com.ingazgate.crm.asset.Department;
import com.ingazgate.crm.asset.DepartmentRepository;
import com.ingazgate.crm.asset.University;
import com.ingazgate.crm.asset.UniversityRepository;
import com.ingazgate.crm.student.Student;
import com.ingazgate.crm.student.StudentApplication;
import com.ingazgate.crm.student.StudentApplicationRepository;
import com.ingazgate.crm.student.StudentRepository;
import com.ingazgate.crm.student.StudentServiceRecordRepository;
import com.ingazgate.crm.support.SemesterOptions;
import com.ingazgate.crm.support.UserDisplayNames;
import com.ingazgate.crm.user.AdminNotificationService;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import com.ingazgate.crm.user.WorkspaceOwnershipService;
import com.ingazgate.crm.util.NationalityCatalog;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.support.MissingServletRequestPartException;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class StudentWebController {
  private static final Logger log = LoggerFactory.getLogger(StudentWebController.class);
  private static final String STUDENT_ID_PATH =
      "/students/{id:[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}}";
  private static final Pattern APPLICATION_ATTACH_PATH =
      Pattern.compile("^/applications/([0-9a-fA-F\\-]{36})/attachments/?$");
  private static final long CATALOG_CACHE_TTL_MS = 5 * 60 * 1000L;

  public static final List<String> APPLICATION_STATUS_OPTIONS =
      List.of("NEW", "IN_PROGRESS", "SUBMITTED", "ACCEPTED", "REJECTED", "WITHDRAWN");

  public static final List<String> APPLICATION_TYPE_OPTIONS = List.of("NEW", "TRANSFER");

  private final AuthUsers authUsers;
  private final StudentRepository studentRepository;
  private final StudentApplicationRepository studentApplicationRepository;
  private final StudentServiceRecordRepository studentServiceRecordRepository;
  private final ApplicationAttachmentRepository applicationAttachmentRepository;
  private final DepartmentRepository departmentRepository;
  private final UniversityRepository universityRepository;
  private final AppUserRepository appUserRepository;
  private final WorkspaceOwnershipService workspaceOwnershipService;
  private final AdminNotificationService adminNotificationService;
  private final ApplicationChatService applicationChatService;
  private final ProgramsCatalogService programsCatalogService;
  private final ObjectMapper objectMapper;
  private volatile List<University> cachedUniversities = List.of();
  private volatile long cachedUniversitiesAt;
  private volatile List<Department> cachedPrograms = List.of();
  private volatile long cachedProgramsAt;

  public StudentWebController(
      AuthUsers authUsers,
      StudentRepository studentRepository,
      StudentApplicationRepository studentApplicationRepository,
      StudentServiceRecordRepository studentServiceRecordRepository,
      ApplicationAttachmentRepository applicationAttachmentRepository,
      DepartmentRepository departmentRepository,
      UniversityRepository universityRepository,
      AppUserRepository appUserRepository,
      WorkspaceOwnershipService workspaceOwnershipService,
      AdminNotificationService adminNotificationService,
      ApplicationChatService applicationChatService,
      ProgramsCatalogService programsCatalogService,
      ObjectMapper objectMapper) {
    this.authUsers = authUsers;
    this.studentRepository = studentRepository;
    this.studentApplicationRepository = studentApplicationRepository;
    this.studentServiceRecordRepository = studentServiceRecordRepository;
    this.applicationAttachmentRepository = applicationAttachmentRepository;
    this.departmentRepository = departmentRepository;
    this.universityRepository = universityRepository;
    this.appUserRepository = appUserRepository;
    this.workspaceOwnershipService = workspaceOwnershipService;
    this.adminNotificationService = adminNotificationService;
    this.applicationChatService = applicationChatService;
    this.programsCatalogService = programsCatalogService;
    this.objectMapper = objectMapper;
  }

  @GetMapping("/students")
  String students(Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    UUID ownerId = workspaceOwnershipService.dataOwnerId(user);
    model.addAttribute("pageTitleKey", "page.students.title");
    model.addAttribute("activeNav", "students");
    model.addAttribute("contentTemplate", "pages/students");
    List<Student> students;
    if (authUsers.canManageAgents(user)) {
      students = studentRepository.findNonAgentWorkspaceStudents();
      UUID workspaceOwnerId = workspaceOwnershipService.ingazgateWorkspaceOwnerId(user);
      if (workspaceOwnerId != null) {
        ownerId = workspaceOwnerId;
      }
    } else {
      students = studentRepository.findByOwnerUser_IdOrderByCreatedAtDesc(ownerId);
    }
    model.addAttribute("students", students);
    model.addAttribute("applicationCountsByStudentId", safeApplicationCountsByStudent(ownerId));
    return "layout/shell";
  }

  @GetMapping("/students/new")
  String newStudentForm(Model model, Principal principal) {
    authUsers.requireCurrentUser(principal);
    model.addAttribute("pageTitleKey", "page.studentsNew.title");
    model.addAttribute("activeNav", "students");
    model.addAttribute("contentTemplate", "pages/student-new");
    model.addAttribute("nationalityOptions", NationalityCatalog.sortedDisplayNames());
    return "layout/shell";
  }

  @PostMapping("/students")
  String createStudent(
      Principal principal,
      @RequestParam("fullName") String fullName,
      @RequestParam(value = "passportNo", required = false) String passportNo,
      @RequestParam(value = "fatherName", required = false) String fatherName,
      @RequestParam(value = "motherName", required = false) String motherName,
      @RequestParam(value = "gender", required = false) String gender,
      @RequestParam(value = "email", required = false) String email,
      @RequestParam(value = "phone", required = false) String phone,
      @RequestParam(value = "nationality", required = false) String nationality,
      RedirectAttributes redirectAttributes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    UUID ownerId = workspaceOwnershipService.dataOwnerId(user);
    String normalizedName = normalize(fullName);
    if (normalizedName.isEmpty()) {
      redirectAttributes.addFlashAttribute("studentErrorKey", "students.flash.nameRequired");
      return "redirect:/students/new";
    }
    if (normalize(passportNo).isEmpty()
        || normalize(phone).isEmpty()
        || normalize(nationality).isEmpty()) {
      redirectAttributes.addFlashAttribute("studentErrorKey", "students.flash.requiredFields");
      return "redirect:/students/new";
    }

    OffsetDateTime now = OffsetDateTime.now();
    Student student = new Student();
    student.setId(UUID.randomUUID());
    student.setOwnerUser(appUserRepository.getReferenceById(ownerId));
    student.setFullName(normalizedName);
    student.setPassportNo(emptyToNull(normalize(passportNo)));
    student.setFatherName(emptyToNull(normalize(fatherName)));
    student.setMotherName(emptyToNull(normalize(motherName)));
    student.setGender(emptyToNull(normalize(gender)));
    student.setEmail(emptyToNull(normalize(email)));
    student.setPhone(emptyToNull(normalize(phone)));
    student.setNationality(emptyToNull(normalize(nationality)));
    student.setCreatedAt(now);
    student.setUpdatedAt(now);
    studentRepository.save(student);
    adminNotificationService.notifyIngazgateAdmins(
        UserDisplayNames.actorLabel(user, authUsers.canManageAgents(user))
            + " added a new student: "
            + normalizedName
            + ".",
        user.getId(),
        "/students/" + student.getId());

    redirectAttributes.addFlashAttribute("studentSuccessKey", "students.flash.created");
    return "redirect:/students";
  }

  @GetMapping(STUDENT_ID_PATH)
  String studentDetail(@PathVariable UUID id, Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    Student student =
        resolveStudentForViewer(id, user)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Student not found"));
    UUID ownerId =
        student.getOwnerUser() != null
            ? student.getOwnerUser().getId()
            : workspaceOwnershipService.dataOwnerId(user);
    model.addAttribute("pageTitle", student.getFullName());
    model.addAttribute("activeNav", "students");
    model.addAttribute("contentTemplate", "pages/student-detail");
    model.addAttribute("student", student);
    model.addAttribute(
        "studentApplications",
        studentApplicationRepository.findForOwnerAndStudent(ownerId, student.getId()));
    model.addAttribute(
        "studentServices",
        studentServiceRecordRepository.listForOwnerAndStudent(ownerId, student.getId()));
    return "layout/shell";
  }

  @GetMapping(STUDENT_ID_PATH + "/edit")
  String editStudentForm(@PathVariable UUID id, Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (!authUsers.canManageAgents(user)) {
      throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Only administrators can edit students.");
    }
    Student student =
        resolveStudentForViewer(id, user)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Student not found"));
    model.addAttribute("pageTitleKey", "page.studentsEdit.title");
    model.addAttribute("activeNav", "students");
    model.addAttribute("contentTemplate", "pages/student-edit");
    model.addAttribute("student", student);
    model.addAttribute("nationalityOptions", NationalityCatalog.sortedDisplayNames());
    return "layout/shell";
  }

  @PostMapping(STUDENT_ID_PATH)
  String updateStudent(
      @PathVariable UUID id,
      Principal principal,
      @RequestParam("fullName") String fullName,
      @RequestParam(value = "passportNo", required = false) String passportNo,
      @RequestParam(value = "fatherName", required = false) String fatherName,
      @RequestParam(value = "motherName", required = false) String motherName,
      @RequestParam(value = "gender", required = false) String gender,
      @RequestParam(value = "email", required = false) String email,
      @RequestParam(value = "phone", required = false) String phone,
      @RequestParam(value = "nationality", required = false) String nationality,
      RedirectAttributes redirectAttributes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (!authUsers.canManageAgents(user)) {
      throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Only administrators can edit students.");
    }
    Student student = resolveStudentForViewer(id, user).orElse(null);
    if (student == null) {
      redirectAttributes.addFlashAttribute("studentErrorKey", "students.flash.notFound");
      return "redirect:/students";
    }
    String normalizedName = normalize(fullName);
    if (normalizedName.isEmpty()) {
      redirectAttributes.addFlashAttribute("studentErrorKey", "students.flash.nameRequired");
      return "redirect:/students/" + id + "/edit";
    }
    if (normalize(passportNo).isEmpty()
        || normalize(phone).isEmpty()
        || normalize(nationality).isEmpty()) {
      redirectAttributes.addFlashAttribute("studentErrorKey", "students.flash.requiredFields");
      return "redirect:/students/" + id + "/edit";
    }
    OffsetDateTime now = OffsetDateTime.now();
    student.setFullName(normalizedName);
    student.setPassportNo(emptyToNull(normalize(passportNo)));
    student.setFatherName(emptyToNull(normalize(fatherName)));
    student.setMotherName(emptyToNull(normalize(motherName)));
    student.setGender(emptyToNull(normalize(gender)));
    student.setEmail(emptyToNull(normalize(email)));
    student.setPhone(emptyToNull(normalize(phone)));
    student.setNationality(emptyToNull(normalize(nationality)));
    student.setUpdatedAt(now);
    studentRepository.save(student);
    redirectAttributes.addFlashAttribute("studentSuccessKey", "students.flash.updated");
    return "redirect:/students/" + id;
  }

  @GetMapping("/applications")
  String applications(
      Model model,
      Principal principal,
      @RequestParam(value = "status", required = false) String status,
      @RequestParam(value = "semester", required = false) String semester,
      @RequestParam(value = "universityId", required = false) String universityIdParam,
      @RequestParam(value = "programId", required = false) String programIdParam,
      @RequestParam(value = "openEdit", required = false) String openEditParam) {
    AppUser user = authUsers.requireCurrentUser(principal);
    model.addAttribute("pageTitleKey", "page.applications.title");
    model.addAttribute("activeNav", "applications");
    model.addAttribute("contentTemplate", "pages/applications");
    String statusFilter = emptyToNull(normalize(status));
    String semesterFilter = emptyToNull(normalize(semester));
    UUID universityId = parseUuid(universityIdParam);
    UUID programId = parseUuid(programIdParam);
    List<StudentApplication> applications = List.of();
    List<String> semesterOptions = List.of();
    try {
      if (authUsers.canManageAgents(user)) {
        applications =
            studentApplicationRepository.findAllApplicationsFiltered(
                statusFilter, semesterFilter, universityId, programId);
        semesterOptions = studentApplicationRepository.findDistinctSemestersAll();
      } else {
        UUID ownerId = workspaceOwnershipService.dataOwnerId(user);
        applications =
            studentApplicationRepository.findForOwnerFiltered(
                ownerId, statusFilter, semesterFilter, universityId, programId);
        semesterOptions = studentApplicationRepository.findDistinctSemestersForOwner(ownerId);
      }
    } catch (RuntimeException ex) {
      model.addAttribute("applicationErrorKey", "applications.edit.loadError");
    }
    model.addAttribute("applications", applications);
    model.addAttribute("semesterOptions", SemesterOptions.withStoredTerms(semesterOptions));
    model.addAttribute("applicationStatuses", APPLICATION_STATUS_OPTIONS);
    model.addAttribute("filterStatus", statusFilter == null ? "" : statusFilter);
    model.addAttribute("filterSemester", semesterFilter == null ? "" : semesterFilter);
    model.addAttribute("filterUniversityId", universityId);
    model.addAttribute("filterProgramId", programId);
    model.addAttribute("universities", safeUniversities());
    model.addAttribute("programs", safePrograms());
    model.addAttribute("filterProgramLabel", programFilterLabel(programId));
    model.addAttribute("openEditApplicationId", parseUuid(openEditParam));
    return "layout/shell";
  }

  private String programFilterLabel(UUID programId) {
    if (programId == null) {
      return "";
    }
    return departmentRepository
        .findById(programId)
        .map(
            d -> {
              var u = d.getUniversity();
              String uni = u != null ? u.getName() : "";
              String name = d.getName() != null ? d.getName() : "";
              if (!uni.isEmpty() && !name.isEmpty()) {
                return uni + " — " + name;
              }
              return name.isEmpty() ? uni : name;
            })
        .orElse("");
  }

  /** Declared before {@code /applications/{id}} so the literal path is never captured as a UUID. */
  @GetMapping("/applications/new")
  String newApplicationForm(
      Model model,
      Principal principal,
      @RequestParam(value = "studentId", required = false) String studentIdParam) {
    AppUser user = authUsers.requireCurrentUser(principal);
    UUID ownerId = workspaceOwnershipService.dataOwnerId(user);
    model.addAttribute("pageTitleKey", "page.applicationsNew.title");
    model.addAttribute("activeNav", "applications");
    model.addAttribute("contentTemplate", "pages/application-new");
    List<Student> pickerStudents =
        authUsers.canManageAgents(user)
            ? studentRepository.findNonAgentWorkspaceStudents()
            : studentRepository.findByOwnerUser_IdOrderByCreatedAtDesc(ownerId);
    model.addAttribute("students", pickerStudents);
    model.addAttribute("applicationTypes", APPLICATION_TYPE_OPTIONS);
    model.addAttribute("applicationStatuses", APPLICATION_STATUS_OPTIONS);
    UUID selectedStudentId = parseUuid(studentIdParam);
    model.addAttribute("selectedStudentId", selectedStudentId);
    String selectedStudentName = "";
    if (selectedStudentId != null) {
      selectedStudentName =
          studentRepository
              .findByIdAndOwnerUser_Id(selectedStudentId, ownerId)
              .map(Student::getFullName)
              .orElse("");
    }
    model.addAttribute("selectedStudentName", selectedStudentName);
    model.addAttribute("semesterOptions", SemesterOptions.currentYearTerms());
    putProgramPickerModel(model);
    return "layout/shell";
  }

  @GetMapping("/applications/{id}")
  String applicationDetail(
      @PathVariable UUID id,
      @RequestParam(value = "tab", required = false) String tab,
      Model model,
      Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    StudentApplication application =
        resolveApplicationForViewer(id, user)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Application not found"));
    Map<UUID, Long> unreadMap =
        applicationChatService.unreadCountsForApplications(List.of(application.getId()), user);
    long unreadCount = unreadMap.getOrDefault(application.getId(), 0L);
    String activeTab = resolveApplicationDetailTab(tab, unreadCount > 0);

    model.addAttribute("pageTitle", application.getApplicationNumber());
    model.addAttribute("activeNav", "applications");
    model.addAttribute("contentTemplate", "pages/application-detail");
    model.addAttribute("studentApplication", application);
    model.addAttribute(
        "applicationAttachments",
        applicationAttachmentRepository.findByApplication_IdOrderByCreatedAtDesc(application.getId()));
    model.addAttribute("applicationChatUnreadCount", unreadCount);
    model.addAttribute("activeTab", activeTab);
    model.addAttribute("chatViewer", user);
    List<ApplicationChatLine> chatLines =
        "chat".equals(activeTab)
            ? applicationChatService.loadChatForPage(application.getId(), user)
            : List.of();
    model.addAttribute("applicationChatMessages", chatLines);
    model.addAttribute("bodyPageClass", "page-application-detail");
    return "layout/shell";
  }

  @PostMapping("/applications/{id}/chat")
  String postApplicationChat(
      @PathVariable UUID id,
      Principal principal,
      @RequestParam(value = "body", required = false) String body,
      RedirectAttributes redirectAttributes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (resolveApplicationForViewer(id, user).isEmpty()) {
      throw new ResponseStatusException(HttpStatus.NOT_FOUND);
    }
    try {
      applicationChatService.postMessage(id, user, body, null);
      redirectAttributes.addFlashAttribute(
          "applicationChatSuccessKey", "applications.chat.flash.sent");
    } catch (IllegalArgumentException ex) {
      String code = ex.getMessage() != null ? ex.getMessage() : "error";
      String key =
          switch (code) {
            case "empty" -> "applications.chat.flash.empty";
            case "fileTooLarge" -> "applications.chat.flash.fileTooLarge";
            default -> "applications.chat.flash.error";
          };
      redirectAttributes.addFlashAttribute("applicationChatErrorKey", key);
    }
    return "redirect:/applications/" + id + "?tab=chat";
  }

  @GetMapping("/applications/{applicationId}/chat/{messageId}/download")
  ResponseEntity<ByteArrayResource> downloadApplicationChatFile(
      @PathVariable UUID applicationId,
      @PathVariable UUID messageId,
      Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    var row = applicationChatService.findMessageForDownload(applicationId, messageId, user);
    if (row.isEmpty() || row.get().getContent() == null || row.get().getContent().length == 0) {
      return ResponseEntity.notFound().build();
    }
    ApplicationMessage m = row.get();
    String ct =
        m.getContentType() == null || m.getContentType().isBlank()
            ? MediaType.APPLICATION_OCTET_STREAM_VALUE
            : m.getContentType();
    String fn = m.getFileName() == null ? "attachment.bin" : m.getFileName().replace("\"", "");
    return ResponseEntity.ok()
        .contentType(MediaType.parseMediaType(ct))
        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fn + "\"")
        .body(new ByteArrayResource(m.getContent()));
  }

  private static String resolveApplicationDetailTab(String tabParam, boolean hasUnread) {
    if (tabParam != null && !tabParam.isBlank()) {
      return "chat".equalsIgnoreCase(tabParam.trim()) ? "chat" : "attachments";
    }
    return hasUnread ? "chat" : "attachments";
  }

  @PostMapping("/applications")
  String createApplication(
      Principal principal,
      @RequestParam("studentId") UUID studentId,
      @RequestParam("programId") UUID programId,
      @RequestParam(value = "programLanguage", required = false) String programLanguage,
      @RequestParam(value = "type", required = false) String type,
      @RequestParam(value = "status", required = false) String status,
      @RequestParam(value = "semester", required = false) String semester,
      @RequestParam(value = "notes", required = false) String notes,
      RedirectAttributes redirectAttributes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    UUID ownerId = workspaceOwnershipService.dataOwnerId(user);
    Student student =
        studentRepository
            .findByIdAndOwnerUser_Id(studentId, ownerId)
            .orElse(null);
    if (student == null) {
      redirectAttributes.addFlashAttribute("applicationErrorKey", "applications.flash.studentInvalid");
      return "redirect:/applications/new";
    }
    Optional<Department> program = departmentRepository.findById(programId);
    if (program.isEmpty()) {
      redirectAttributes.addFlashAttribute("applicationErrorKey", "applications.flash.programRequired");
      return "redirect:/applications/new";
    }
    String langForm = normalize(programLanguage);
    if (!langForm.isEmpty()) {
      String depLang =
          program.get().getLanguage() == null ? "" : program.get().getLanguage().trim();
      if (!depLang.equalsIgnoreCase(langForm)) {
        redirectAttributes.addFlashAttribute(
            "applicationErrorKey", "applications.flash.languageProgramMismatch");
        return "redirect:/applications/new";
      }
    }

    OffsetDateTime now = OffsetDateTime.now();
    long seq = studentApplicationRepository.nextApplicationNumber();
    String applicationNumber = "IN-" + String.format("%06d", seq);

    StudentApplication application = new StudentApplication();
    application.setId(UUID.randomUUID());
    application.setOwnerUser(appUserRepository.getReferenceById(ownerId));
    application.setStudent(student);
    application.setDepartment(program.get());
    application.setApplicationNumber(applicationNumber);
    if (authUsers.canManageAgents(user)) {
      application.setStatus(normalizeStatus(status));
      application.setApplicationType("NEW");
    } else {
      application.setStatus("NEW");
      application.setApplicationType(normalizeApplicationType(type));
    }
    application.setItemsCount(0);
    application.setSemester(clampSemester(semester));
    application.setNotes(clampNotes(notes));
    application.setCreatedAt(now);
    application.setUpdatedAt(now);
    studentApplicationRepository.save(application);
    adminNotificationService.notifyIngazgateAdmins(
        UserDisplayNames.actorLabel(user, authUsers.canManageAgents(user))
            + " created application "
            + applicationNumber
            + ".",
        user.getId(),
        "/applications/" + application.getId());

    redirectAttributes.addFlashAttribute("applicationSuccessKey", "applications.flash.created");
    return "redirect:/applications";
  }

  @PostMapping("/applications/{id}/attachments")
  String uploadApplicationAttachment(
      @PathVariable UUID id,
      Principal principal,
      @RequestParam(value = "file", required = false) MultipartFile file,
      @RequestParam(value = "files", required = false) List<MultipartFile> files,
      RedirectAttributes redirectAttributes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    StudentApplication application = resolveApplicationForViewer(id, user).orElse(null);
    if (application == null) {
      redirectAttributes.addFlashAttribute("applicationErrorKey", "applications.flash.notFound");
      return "redirect:/applications";
    }

    List<MultipartFile> incoming = new ArrayList<>();
    if (files != null) {
      for (MultipartFile part : files) {
        if (part != null && !part.isEmpty()) {
          incoming.add(part);
        }
      }
    }
    if (file != null && !file.isEmpty()) {
      incoming.add(file);
    }
    if (incoming.isEmpty()) {
      redirectAttributes.addFlashAttribute("applicationErrorKey", "applications.attachments.error.required");
      return "redirect:/applications/" + id + "#attachments";
    }

    int saved = 0;
    for (MultipartFile part : incoming) {
      if (part.getSize() > APPLICATION_ATTACHMENT_MAX_BYTES) {
        redirectAttributes.addFlashAttribute("applicationErrorKey", "applications.attachments.error.maxSize");
        return "redirect:/applications/" + id + "#attachments";
      }
      try {
        persistApplicationAttachment(application, part);
        saved++;
      } catch (IllegalStateException ex) {
        redirectAttributes.addFlashAttribute(
            "applicationErrorKey", "applications.attachments.error.uploadFailed");
        return "redirect:/applications/" + id + "#attachments";
      } catch (RuntimeException ex) {
        log.error("Failed to persist attachment for applicationId={}", id, ex);
        redirectAttributes.addFlashAttribute("applicationErrorKey", "applications.attachments.error.uploadFailed");
        return "redirect:/applications/" + id + "#attachments";
      }
    }

    redirectAttributes.addFlashAttribute(
        "applicationSuccessKey",
        saved > 1 ? "applications.attachments.flash.uploadedMany" : "applications.attachments.flash.uploaded");
    return "redirect:/applications/" + id + "#attachments";
  }

  @GetMapping("/applications/{id}/attachments/{attachmentId}/download")
  ResponseEntity<ByteArrayResource> downloadApplicationAttachment(
      @PathVariable UUID id, @PathVariable UUID attachmentId, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    StudentApplication application =
        resolveApplicationForViewer(id, user)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Application not found"));
    ApplicationAttachment row =
        applicationAttachmentRepository
            .findByIdAndApplication_Id(attachmentId, application.getId())
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Attachment not found"));

    String contentType =
        row.getContentType() == null || row.getContentType().isBlank()
            ? MediaType.APPLICATION_OCTET_STREAM_VALUE
            : row.getContentType();
    return ResponseEntity.ok()
        .contentType(MediaType.parseMediaType(contentType))
        .header(
            HttpHeaders.CONTENT_DISPOSITION,
            "attachment; filename=\"" + row.getFileName().replace("\"", "") + "\"")
        .body(new ByteArrayResource(row.getContent()));
  }

  @PostMapping("/applications/{id}/attachments/{attachmentId}/delete")
  String deleteApplicationAttachment(
      @PathVariable UUID id,
      @PathVariable UUID attachmentId,
      Principal principal,
      RedirectAttributes redirectAttributes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    StudentApplication application = resolveApplicationForViewer(id, user).orElse(null);
    if (application == null) {
      redirectAttributes.addFlashAttribute("applicationErrorKey", "applications.flash.notFound");
      return "redirect:/applications";
    }
    ApplicationAttachment row =
        applicationAttachmentRepository
            .findByIdAndApplication_Id(attachmentId, application.getId())
            .orElse(null);
    if (row == null) {
      redirectAttributes.addFlashAttribute(
          "applicationErrorKey", "applications.attachments.flash.notFound");
      return "redirect:/applications/" + id;
    }
    applicationAttachmentRepository.delete(row);
    redirectAttributes.addFlashAttribute(
        "applicationSuccessKey", "applications.attachments.flash.deleted");
    return "redirect:/applications/" + id;
  }

  @GetMapping(value = "/applications/{id}/edit-data", produces = MediaType.APPLICATION_JSON_VALUE)
  @ResponseBody
  ResponseEntity<ApplicationEditJson> applicationEditData(
      @PathVariable UUID id, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    Optional<StudentApplication> row = resolveApplicationForViewer(id, user);
    if (row.isEmpty()) {
      return ResponseEntity.notFound().build();
    }
    StudentApplication a = row.get();
    UUID programId = a.getDepartment() != null ? a.getDepartment().getId() : null;
    String studentName =
        a.getStudent() != null && a.getStudent().getFullName() != null
            ? a.getStudent().getFullName()
            : "—";
    String semester = a.getSemester() == null ? "" : a.getSemester();
    String notes = a.getNotes() == null ? "" : a.getNotes();
    String status = a.getStatus() == null ? "NEW" : a.getStatus();
    String applicationType = a.getApplicationType() == null ? "NEW" : a.getApplicationType();
    return ResponseEntity.ok(
        new ApplicationEditJson(
            a.getId(),
            a.getApplicationNumber(),
            studentName,
            programId,
            status,
            applicationType,
            semester,
            notes));
  }

  @GetMapping("/applications/{id}/edit")
  String editApplicationForm(@PathVariable UUID id, Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    StudentApplication application =
        resolveApplicationForViewer(id, user)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Application not found"));
    UUID dataOwnerId = application.getOwnerUser().getId();
    model.addAttribute("pageTitleKey", "page.applicationsEdit.title");
    model.addAttribute("activeNav", "applications");
    model.addAttribute("contentTemplate", "pages/application-edit");
    model.addAttribute("studentApplication", application);
    model.addAttribute("programs", departmentRepository.findAllByOrderByNameAsc());
    model.addAttribute("applicationStatuses", APPLICATION_STATUS_OPTIONS);
    model.addAttribute("applicationTypes", APPLICATION_TYPE_OPTIONS);
    model.addAttribute(
        "semesterOptions",
        SemesterOptions.withStoredTermsAndExtra(
            studentApplicationRepository.findDistinctSemestersForOwner(dataOwnerId),
            application.getSemester()));
    return "layout/shell";
  }

  @PostMapping("/applications/{id}")
  String updateApplication(
      @PathVariable UUID id,
      Principal principal,
      @RequestParam("programId") UUID programId,
      @RequestParam(value = "status", required = false) String status,
      @RequestParam(value = "type", required = false) String type,
      @RequestParam(value = "semester", required = false) String semester,
      @RequestParam(value = "notes", required = false) String notes,
      RedirectAttributes redirectAttributes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    Optional<StudentApplication> row = resolveApplicationForViewer(id, user);
    if (row.isEmpty()) {
      redirectAttributes.addFlashAttribute("applicationErrorKey", "applications.flash.notFound");
      return "redirect:/applications";
    }
    Optional<Department> program = departmentRepository.findById(programId);
    if (program.isEmpty()) {
      redirectAttributes.addFlashAttribute("applicationErrorKey", "applications.flash.programRequired");
      return "redirect:/applications/" + id + "/edit";
    }
    StudentApplication application = row.get();
    application.setDepartment(program.get());
    if (authUsers.canManageAgents(user)) {
      application.setStatus(normalizeStatus(status));
    }
    if (type != null && !type.isBlank()) {
      application.setApplicationType(normalizeApplicationType(type));
    }
    application.setSemester(clampSemester(semester));
    application.setNotes(clampNotes(notes));
    application.setUpdatedAt(OffsetDateTime.now());
    studentApplicationRepository.save(application);
    redirectAttributes.addFlashAttribute("applicationSuccessKey", "applications.flash.updated");
    return "redirect:/applications";
  }

  @PostMapping("/applications/{id}/status")
  String updateApplicationStatus(
      @PathVariable UUID id,
      Principal principal,
      @RequestParam("status") String status,
      RedirectAttributes redirectAttributes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (!authUsers.canManageAgents(user)) {
      throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Only administrators can change application status.");
    }
    StudentApplication application =
        resolveApplicationForViewer(id, user)
            .orElse(null);
    if (application == null) {
      redirectAttributes.addFlashAttribute("applicationErrorKey", "applications.flash.notFound");
      return "redirect:/applications";
    }
    application.setStatus(normalizeStatus(status));
    application.setUpdatedAt(OffsetDateTime.now());
    studentApplicationRepository.save(application);
    redirectAttributes.addFlashAttribute("applicationSuccessKey", "applications.flash.statusUpdated");
    return "redirect:/applications";
  }

  @PostMapping("/applications/{id}/delete")
  String deleteApplication(
      @PathVariable UUID id, Principal principal, RedirectAttributes redirectAttributes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    Optional<StudentApplication> row = resolveApplicationForViewer(id, user);
    if (row.isEmpty()) {
      redirectAttributes.addFlashAttribute("applicationErrorKey", "applications.flash.notFound");
      return "redirect:/applications";
    }
    studentApplicationRepository.delete(row.get());
    redirectAttributes.addFlashAttribute("applicationSuccessKey", "applications.flash.deleted");
    return "redirect:/applications";
  }

  @PostMapping(STUDENT_ID_PATH + "/delete")
  String deleteStudent(
      @PathVariable UUID id, Principal principal, RedirectAttributes redirectAttributes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (!authUsers.canManageAgents(user)) {
      throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Only administrators can delete students.");
    }
    Optional<Student> student = resolveStudentForViewer(id, user);
    if (student.isEmpty()) {
      redirectAttributes.addFlashAttribute("studentErrorKey", "students.flash.notFound");
      return "redirect:/students";
    }
    studentRepository.delete(student.get());
    redirectAttributes.addFlashAttribute("studentSuccessKey", "students.flash.deleted");
    return "redirect:/students";
  }

  /** Own workspace for agents; staff workspace or any agent-owned row for admins. */
  private Optional<Student> resolveStudentForViewer(UUID id, AppUser user) {
    if (authUsers.canManageAgents(user)) {
      return studentRepository
          .findByIdWithOwner(id)
          .filter(s -> workspaceOwnershipService.canIngazgateAdminViewOwner(s.getOwnerUser()));
    }
    UUID ownerId = workspaceOwnershipService.dataOwnerId(user);
    return studentRepository.findByIdAndOwnerUser_Id(id, ownerId);
  }

  private Optional<StudentApplication> resolveApplicationForViewer(UUID id, AppUser user) {
    UUID ownerId = workspaceOwnershipService.dataOwnerId(user);
    Optional<StudentApplication> row =
        studentApplicationRepository.findByIdAndOwnerUser_IdForEdit(id, ownerId);
    if (row.isPresent()) {
      return row;
    }
    if (authUsers.canManageAgents(user)) {
      return studentApplicationRepository
          .findByIdWithGraph(id)
          .filter(
              a ->
                  a.getOwnerUser() != null
                      && workspaceOwnershipService.canIngazgateAdminViewOwner(a.getOwnerUser()));
    }
    return Optional.empty();
  }

  @ExceptionHandler({
    MultipartException.class,
    MaxUploadSizeExceededException.class,
    MissingServletRequestPartException.class
  })
  String handleAttachmentUploadExceptions(
      Exception ex, HttpServletRequest request, RedirectAttributes redirectAttributes) {
    String uri = request.getRequestURI() == null ? "" : request.getRequestURI();
    Matcher matcher = APPLICATION_ATTACH_PATH.matcher(uri);
    if (matcher.matches()) {
      String appId = matcher.group(1);
      if (ex instanceof MaxUploadSizeExceededException) {
        redirectAttributes.addFlashAttribute(
            "applicationErrorKey", "applications.attachments.error.maxSize");
      } else if (ex instanceof MissingServletRequestPartException) {
        redirectAttributes.addFlashAttribute(
            "applicationErrorKey", "applications.attachments.error.required");
      } else {
        redirectAttributes.addFlashAttribute(
            "applicationErrorKey", "applications.attachments.error.uploadFailed");
      }
      return "redirect:/applications/" + appId + "#attachments";
    }
    throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid multipart request", ex);
  }

  private List<University> safeUniversities() {
    long now = System.currentTimeMillis();
    List<University> hit = cachedUniversities;
    if (!hit.isEmpty() && now - cachedUniversitiesAt < CATALOG_CACHE_TTL_MS) {
      return hit;
    }
    synchronized (this) {
      hit = cachedUniversities;
      now = System.currentTimeMillis();
      if (!hit.isEmpty() && now - cachedUniversitiesAt < CATALOG_CACHE_TTL_MS) {
        return hit;
      }
      try {
        List<University> fresh = universityRepository.findAllByOrderByNameAsc();
        cachedUniversities = fresh;
        cachedUniversitiesAt = now;
        return fresh;
      } catch (RuntimeException ex) {
        return List.of();
      }
    }
  }

  private List<Department> safePrograms() {
    long now = System.currentTimeMillis();
    List<Department> hit = cachedPrograms;
    if (!hit.isEmpty() && now - cachedProgramsAt < CATALOG_CACHE_TTL_MS) {
      return hit;
    }
    synchronized (this) {
      hit = cachedPrograms;
      now = System.currentTimeMillis();
      if (!hit.isEmpty() && now - cachedProgramsAt < CATALOG_CACHE_TTL_MS) {
        return hit;
      }
      try {
        List<Department> fresh = departmentRepository.findAllByOrderByNameAsc();
        cachedPrograms = fresh;
        cachedProgramsAt = now;
        return fresh;
      } catch (RuntimeException ex) {
        return List.of();
      }
    }
  }

  private Map<UUID, Long> safeApplicationCountsByStudent(UUID ownerId) {
    if (ownerId == null) {
      return Map.of();
    }
    try {
      return applicationCountsByStudent(ownerId);
    } catch (RuntimeException ex) {
      return Map.of();
    }
  }

  private Map<UUID, Long> applicationCountsByStudent(UUID ownerId) {
    Map<UUID, Long> map = new HashMap<>();
    for (Object[] row : studentApplicationRepository.countApplicationsPerStudent(ownerId)) {
      map.put((UUID) row[0], ((Number) row[1]).longValue());
    }
    return map;
  }

  private static String normalizeStatus(String raw) {
    String s = normalize(raw).toUpperCase(Locale.ROOT);
    if (s.isEmpty()) {
      return "NEW";
    }
    if (APPLICATION_STATUS_OPTIONS.contains(s)) {
      return s;
    }
    return "NEW";
  }

  private static String normalizeApplicationType(String raw) {
    String s = normalize(raw).toUpperCase(Locale.ROOT);
    if (APPLICATION_TYPE_OPTIONS.contains(s)) {
      return s;
    }
    return "NEW";
  }

  private static final int APPLICATION_NOTES_MAX_LEN = 4000;
  private static final int APPLICATION_SEMESTER_MAX_LEN = 120;
  private static final long APPLICATION_ATTACHMENT_MAX_BYTES = 10L * 1024L * 1024L;

  private static String clampSemester(String raw) {
    if (raw == null) {
      return null;
    }
    String t = raw.trim();
    if (t.isEmpty()) {
      return null;
    }
    if (t.length() > APPLICATION_SEMESTER_MAX_LEN) {
      return t.substring(0, APPLICATION_SEMESTER_MAX_LEN);
    }
    return t;
  }

  private static String clampNotes(String raw) {
    if (raw == null) {
      return null;
    }
    String t = raw.trim();
    if (t.isEmpty()) {
      return null;
    }
    if (t.length() > APPLICATION_NOTES_MAX_LEN) {
      return t.substring(0, APPLICATION_NOTES_MAX_LEN);
    }
    return t;
  }

  private static String normalize(String value) {
    return value == null ? "" : value.trim();
  }

  private static String emptyToNull(String value) {
    return value == null || value.isEmpty() ? null : value;
  }

  private static UUID parseUuid(String raw) {
    if (raw == null || raw.isBlank()) {
      return null;
    }
    try {
      return UUID.fromString(raw.trim());
    } catch (IllegalArgumentException e) {
      return null;
    }
  }

  private void putProgramPickerModel(Model model) {
    List<ProgramPickerOption> opts = buildProgramPickerOptions();
    try {
      model.addAttribute("programOptionsJson", objectMapper.writeValueAsString(opts));
    } catch (JsonProcessingException e) {
      model.addAttribute("programOptionsJson", "[]");
    }
    LinkedHashSet<String> degrees = new LinkedHashSet<>();
    LinkedHashSet<String> langs = new LinkedHashSet<>();
    for (ProgramPickerOption o : opts) {
      if (o.degree() != null && !o.degree().isBlank()) {
        degrees.add(o.degree().trim());
      }
      if (o.language() != null && !o.language().isBlank()) {
        langs.add(o.language().trim());
      }
    }
    List<String> sortedDegrees = new ArrayList<>(degrees);
    sortedDegrees.sort(String.CASE_INSENSITIVE_ORDER);
    List<String> sortedLangs = new ArrayList<>(langs);
    sortedLangs.sort(String.CASE_INSENSITIVE_ORDER);
    model.addAttribute("programDegrees", sortedDegrees);
    model.addAttribute("programLanguages", sortedLangs);
  }

  private List<ProgramPickerOption> buildProgramPickerOptions() {
    List<ProgramPickerOption> list = new ArrayList<>();
    for (ProgramListItem p : programsCatalogService.listAll()) {
      if (p.universityId() == null) {
        continue;
      }
      String uniName = p.universityName() == null ? "" : p.universityName().trim();
      String progName = p.name() == null ? "" : p.name().trim();
      String lang = p.language() == null ? "" : p.language().trim();
      String deg = p.degree() == null ? "" : p.degree().trim();
      list.add(new ProgramPickerOption(p.id(), p.universityId(), uniName, progName, deg, lang));
    }
    list.sort(
        Comparator.comparing((ProgramPickerOption o) -> o.degree().toLowerCase(Locale.ROOT))
            .thenComparing(o -> o.language().toLowerCase(Locale.ROOT))
            .thenComparing(o -> o.programName().toLowerCase(Locale.ROOT))
            .thenComparing(o -> o.universityName().toLowerCase(Locale.ROOT)));
    return list;
  }

  private void persistApplicationAttachment(StudentApplication application, MultipartFile file) {
    byte[] content;
    try {
      content = file.getBytes();
    } catch (Exception ex) {
      throw new IllegalStateException("applications.attachments.error.uploadFailed");
    }
    ApplicationAttachment row = new ApplicationAttachment();
    row.setId(UUID.randomUUID());
    row.setOwnerUser(application.getOwnerUser());
    row.setApplication(application);
    row.setFileName(safeFileName(file.getOriginalFilename()));
    row.setContentType(file.getContentType());
    row.setSizeBytes(content.length);
    row.setContent(content);
    row.setCreatedAt(OffsetDateTime.now());
    applicationAttachmentRepository.save(row);
  }

  private static String safeFileName(String original) {
    String fallback = "attachment.bin";
    if (original == null || original.isBlank()) {
      return fallback;
    }
    String cleaned = original.replace("\\", "/");
    int slash = cleaned.lastIndexOf('/');
    String base = slash >= 0 ? cleaned.substring(slash + 1) : cleaned;
    base = base.trim();
    if (base.isEmpty()) {
      return fallback;
    }
    if (base.length() > 180) {
      return base.substring(base.length() - 180);
    }
    return base;
  }

}
