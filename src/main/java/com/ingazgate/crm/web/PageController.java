package com.ingazgate.crm.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ingazgate.crm.asset.Department;
import com.ingazgate.crm.asset.DepartmentRepository;
import com.ingazgate.crm.asset.University;
import com.ingazgate.crm.asset.UniversityRepository;
import com.ingazgate.crm.feedback.NewsPost;
import com.ingazgate.crm.feedback.NewsPostRepository;
import com.ingazgate.crm.student.ApplicationChatService;
import com.ingazgate.crm.student.StudentApplication;
import com.ingazgate.crm.student.StudentApplicationRepository;
import com.ingazgate.crm.student.StudentRepository;
import com.ingazgate.crm.student.StudentServiceRecordRepository;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import com.ingazgate.crm.user.WorkspaceOwnershipService;
import com.ingazgate.crm.util.NationalityCatalog;
import java.security.Principal;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;
import java.util.UUID;
import java.util.stream.Collectors;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PageController {
  private final UniversityRepository universityRepository;
  private final DepartmentRepository departmentRepository;
  private final StudentRepository studentRepository;
  private final StudentApplicationRepository studentApplicationRepository;
  private final StudentServiceRecordRepository studentServiceRecordRepository;
  private final AppUserRepository appUserRepository;
  private final WorkspaceOwnershipService workspaceOwnershipService;
  private final AuthUsers authUsers;
  private final ProgramsCatalogService programsCatalog;
  private final UniversitiesCatalogService universitiesCatalog;
  private final ApplicationChatService applicationChatService;
  private final NewsPostRepository newsPostRepository;
  private final ObjectMapper objectMapper;

  public PageController(
      UniversityRepository universityRepository,
      DepartmentRepository departmentRepository,
      StudentRepository studentRepository,
      StudentApplicationRepository studentApplicationRepository,
      StudentServiceRecordRepository studentServiceRecordRepository,
      AppUserRepository appUserRepository,
      WorkspaceOwnershipService workspaceOwnershipService,
      AuthUsers authUsers,
      ProgramsCatalogService programsCatalog,
      UniversitiesCatalogService universitiesCatalog,
      ApplicationChatService applicationChatService,
      NewsPostRepository newsPostRepository,
      ObjectMapper objectMapper) {
    this.universityRepository = universityRepository;
    this.departmentRepository = departmentRepository;
    this.studentRepository = studentRepository;
    this.studentApplicationRepository = studentApplicationRepository;
    this.studentServiceRecordRepository = studentServiceRecordRepository;
    this.appUserRepository = appUserRepository;
    this.workspaceOwnershipService = workspaceOwnershipService;
    this.authUsers = authUsers;
    this.programsCatalog = programsCatalog;
    this.universitiesCatalog = universitiesCatalog;
    this.applicationChatService = applicationChatService;
    this.newsPostRepository = newsPostRepository;
    this.objectMapper = objectMapper;
  }

  @GetMapping("/")
  String dashboard(Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    UUID ownerId = workspaceOwnershipService.dataOwnerId(user);
    OffsetDateTime dayStart =
        LocalDate.now(ZoneOffset.UTC).atStartOfDay().atOffset(ZoneOffset.UTC);
    model.addAttribute("pageTitleKey", "page.dashboard.title");
    model.addAttribute("activeNav", "dashboard");
    model.addAttribute("contentTemplate", "pages/dashboard");
    if (authUsers.canManageAgents(user)) {
      model.addAttribute(
          "dashboardStudentsToday",
          studentRepository.countNonAgentWorkspaceStudentsCreatedSince(dayStart));
      model.addAttribute(
          "dashboardApplicationsToday",
          studentApplicationRepository.countNonAgentApplicationsCreatedSince(dayStart));
      model.addAttribute(
          "recentStudents",
          studentRepository.findTop5NonAgentWorkspaceStudents(PageRequest.of(0, 5)));
      model.addAttribute(
          "recentApplications",
          studentApplicationRepository.findRecentAll(PageRequest.of(0, 5)));
    } else {
      model.addAttribute(
          "dashboardStudentsToday",
          studentRepository.countByOwnerUser_IdAndCreatedAtGreaterThanEqual(ownerId, dayStart));
      model.addAttribute(
          "dashboardApplicationsToday",
          studentApplicationRepository.countByOwnerUser_IdAndCreatedAtGreaterThanEqual(
              ownerId, dayStart));
      model.addAttribute(
          "recentStudents", studentRepository.findTop5ByOwnerUser_IdOrderByCreatedAtDesc(ownerId));
      model.addAttribute(
          "recentApplications",
          studentApplicationRepository.findRecentForOwner(ownerId, PageRequest.of(0, 5)));
    }
    try {
      model.addAttribute(
          "dashboardResidencyEndingSoon",
          studentServiceRecordRepository.findExpiringBetween(
              ownerId,
              ServiceWebController.RESIDENCY_RENEWAL_KEY,
              LocalDate.now(ZoneOffset.UTC),
              LocalDate.now(ZoneOffset.UTC).plusMonths(2)));
    } catch (RuntimeException ex) {
      model.addAttribute("dashboardResidencyEndingSoon", List.of());
    }
    try {
      model.addAttribute(
          "dashboardNewsPosts", newsPostRepository.findAllWithAuthor().stream().limit(5).toList());
    } catch (RuntimeException ex) {
      model.addAttribute("dashboardNewsPosts", List.<NewsPost>of());
    }
    return "layout/shell";
  }

  @GetMapping("/account")
  String account(Model model) {
    model.addAttribute("pageTitleKey", "page.account.title");
    model.addAttribute("activeNav", "account");
    model.addAttribute("contentTemplate", "pages/account");
    return "layout/shell";
  }

  @GetMapping("/programs")
  String programs(Model model) {
    List<University> universities = universityRepository.findAllByOrderByNameAsc();
    ProgramFilterOptions filterOptions = programsCatalog.filterOptions();
    model.addAttribute("programsInitialJson", "[]");
    model.addAttribute("pageTitleKey", "page.programs.title");
    model.addAttribute("activeNav", "programs");
    model.addAttribute("universities", universities);
    model.addAttribute("programDegreeOptions", filterOptions.degrees());
    model.addAttribute("programLanguageOptions", filterOptions.languages());
    model.addAttribute("programCountryOptions", filterOptions.countries());
    model.addAttribute("contentTemplate", "pages/programs");
    return "layout/shell";
  }

  @GetMapping("/departments")
  String departments() {
    return "redirect:/programs";
  }

  @GetMapping("/universities")
  String universities(Model model) {
    List<UniversityListItem> universityRows = universitiesCatalog.listAll();
    Set<String> uniCountries =
        universityRows.stream()
            .map(UniversityListItem::country)
            .filter(c -> c != null && !c.isBlank())
            .collect(Collectors.toCollection(TreeSet::new));
    model.addAttribute("pageTitleKey", "page.universities.title");
    model.addAttribute("activeNav", "universities");
    model.addAttribute("uniCountries", uniCountries);
    model.addAttribute("universityRows", universityRows);
    model.addAttribute("contentTemplate", "pages/universities");
    return "layout/shell";
  }

  @GetMapping("/universities/{id}")
  String universityDetail(@PathVariable UUID id, Model model) {
    University university =
        universityRepository
            .findById(id)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "University not found"));
    List<Department> uniPrograms = departmentRepository.findByUniversity_IdOrderByNameAsc(id);
    model.addAttribute("pageTitle", university.getName());
    model.addAttribute("activeNav", "universities");
    model.addAttribute("university", university);
    model.addAttribute("uniPrograms", uniPrograms);
    model.addAttribute("contentTemplate", "pages/university-detail");
    return "layout/shell";
  }

  @GetMapping("/scholarships")
  String scholarships(Model model) {
    model.addAttribute("pageTitleKey", "page.scholarships.title");
    model.addAttribute("activeNav", "scholarships");
    model.addAttribute("contentTemplate", "pages/scholarships");
    return "layout/shell";
  }

  @GetMapping("/agents")
  String agents(Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (!authUsers.canManageAgents(user)) {
      return "redirect:/";
    }
    model.addAttribute("pageTitleKey", "page.agents.title");
    model.addAttribute("activeNav", "agents");
    List<AppUser> managedAgents = appUserRepository.findAllAgents();
    Map<UUID, Long> agentStudentCounts = new HashMap<>();
    Map<UUID, Long> agentApplicationCounts = new HashMap<>();
    OffsetDateTime epoch = OffsetDateTime.parse("1970-01-01T00:00:00Z");
    for (AppUser agent : managedAgents) {
      if (agent.getId() == null) {
        continue;
      }
      try {
        agentStudentCounts.put(
            agent.getId(),
            studentRepository.countByOwnerUser_IdAndCreatedAtGreaterThanEqual(agent.getId(), epoch));
        agentApplicationCounts.put(
            agent.getId(),
            studentApplicationRepository.countByOwnerUser_IdAndCreatedAtGreaterThanEqual(
                agent.getId(), epoch));
      } catch (RuntimeException ex) {
        agentStudentCounts.put(agent.getId(), 0L);
        agentApplicationCounts.put(agent.getId(), 0L);
      }
    }
    List<UUID> agentIds =
        managedAgents.stream().map(AppUser::getId).filter(Objects::nonNull).toList();
    model.addAttribute("managedAgents", managedAgents);
    model.addAttribute("agentStudentCounts", agentStudentCounts);
    model.addAttribute("agentApplicationCounts", agentApplicationCounts);
    model.addAttribute(
        "agentUnreadCounts", applicationChatService.unreadCountsByAgentOwners(agentIds, user));
    model.addAttribute("contentTemplate", "pages/agents");
    return "layout/shell";
  }

  @GetMapping("/agents/{id}")
  String agentDetail(@PathVariable UUID id, Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    if (!authUsers.canManageAgents(user)) {
      return "redirect:/";
    }
    AppUser agent =
        appUserRepository
            .findById(id)
            .filter(a -> "AGENT".equalsIgnoreCase(a.getRole()))
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Agent not found"));
    OffsetDateTime epoch = OffsetDateTime.parse("1970-01-01T00:00:00Z");
    model.addAttribute("pageTitle", agent.getDisplayName());
    model.addAttribute("activeNav", "agents");
    model.addAttribute("contentTemplate", "pages/agent-detail");
    model.addAttribute("agent", agent);
    model.addAttribute(
        "agentStudentsCount",
        studentRepository.countByOwnerUser_IdAndCreatedAtGreaterThanEqual(agent.getId(), epoch));
    model.addAttribute(
        "agentApplicationsCount",
        studentApplicationRepository.countByOwnerUser_IdAndCreatedAtGreaterThanEqual(
            agent.getId(), epoch));
    model.addAttribute(
        "agentRecentStudents", studentRepository.findTop5ByOwnerUser_IdOrderByCreatedAtDesc(agent.getId()));
    model.addAttribute(
        "agentRecentApplications",
        studentApplicationRepository.findRecentForOwner(agent.getId(), PageRequest.of(0, 5)));
    List<StudentApplication> agentApplications =
        studentApplicationRepository.findAllForOwner(agent.getId());
    model.addAttribute("agentApplications", agentApplications);
    model.addAttribute(
        "applicationIdsWithChatUnread",
        applicationChatService.applicationIdsWithUnread(
            agentApplications.stream().map(StudentApplication::getId).toList(), user));
    return "layout/shell";
  }

  @GetMapping("/old-students")
  String oldStudents(Model model) {
    return oldStudentsByYear("2019-2020", model);
  }

  @GetMapping("/old-students/new")
  String oldStudentNewForm(
      @RequestParam(value = "year", required = false) String year,
      Model model,
      Principal principal) {
    authUsers.requireCurrentUser(principal);
    String preselectedYear = normalizeOldStudentYear(year);
    if (preselectedYear.isEmpty()) {
      preselectedYear = OLD_STUDENT_YEAR_KEYS.get(OLD_STUDENT_YEAR_KEYS.size() - 1);
    }
    populateOldStudentFormModel(model, preselectedYear, null, null, null);
    model.addAttribute("pageTitleKey", "page.oldStudentsNew.title");
    model.addAttribute("activeNav", "oldStudents");
    model.addAttribute("contentTemplate", "pages/old-student-new");
    return "layout/shell";
  }

  @PostMapping("/old-students")
  String oldStudentCreate(
      Principal principal,
      @RequestParam("academicYear") String academicYear,
      @RequestParam("name") String name,
      @RequestParam("university") String university,
      @RequestParam("department") String department,
      @RequestParam("passport") String passport,
      @RequestParam(value = "email", required = false) String email,
      @RequestParam(value = "phone", required = false) String phone,
      @RequestParam("nationality") String nationality,
      RedirectAttributes redirectAttributes) {
    authUsers.requireCurrentUser(principal);
    String normalizedYear = normalizeOldStudentYear(academicYear);
    if (!OLD_STUDENT_YEAR_KEYS.contains(normalizedYear)) {
      redirectAttributes.addFlashAttribute("oldStudentErrorKey", "oldStudents.flash.invalidYear");
      return "redirect:/old-students/new";
    }
    String validationError = validateOldStudentFields(name, passport, university, department, nationality);
    if (validationError != null) {
      redirectAttributes.addFlashAttribute("oldStudentErrorKey", validationError);
      redirectAttributes.addAttribute("year", normalizedYear.replace(" ", "-"));
      return "redirect:/old-students/new";
    }
    List<Map<String, String>> rows = OLD_STUDENTS_DATA.computeIfAbsent(normalizedYear, y -> new ArrayList<>());
    rows.add(
        oldStudentRow(name, university, department, passport, email, phone, nationality));
    redirectAttributes.addFlashAttribute("oldStudentSuccessKey", "oldStudents.flash.created");
    return "redirect:/old-students/" + normalizedYear.replace(" ", "-");
  }

  @GetMapping("/old-students/{yearKey}")
  String oldStudentsByYear(@PathVariable String yearKey, Model model) {
    Map<String, List<Map<String, String>>> data = OLD_STUDENTS_DATA;
    String normalized = yearKey.replace("-", " ").trim();
    if (!data.containsKey(normalized)) {
      throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Year not found");
    }

    List<Map<String, String>> baseRows = data.get(normalized);

    Set<String> uniOptions =
        baseRows.stream()
            .map(r -> r.getOrDefault("university", "").trim())
            .filter(s -> !s.isEmpty())
            .collect(Collectors.toCollection(TreeSet::new));
    Set<String> depOptions =
        baseRows.stream()
            .map(r -> r.getOrDefault("department", "").trim())
            .filter(s -> !s.isEmpty())
            .collect(Collectors.toCollection(TreeSet::new));
    Set<String> natOptions =
        baseRows.stream()
            .map(r -> r.getOrDefault("nationality", "").trim())
            .filter(s -> !s.isEmpty())
            .collect(Collectors.toCollection(TreeSet::new));

    model.addAttribute("pageTitleKey", "page.oldStudents.title");
    model.addAttribute("activeNav", "oldStudents");
    model.addAttribute("oldStudentYears", OLD_STUDENT_YEAR_KEYS);
    model.addAttribute("selectedOldStudentYear", normalized);
    model.addAttribute("oldStudentsRows", baseRows);
    model.addAttribute("oldStudentsUniversityOptions", uniOptions);
    model.addAttribute("oldStudentsDepartmentOptions", depOptions);
    model.addAttribute("oldStudentsNationalityOptions", natOptions);
    model.addAttribute("oldStudentsYearTotalCount", baseRows.size());
    model.addAttribute("contentTemplate", "pages/old-students");
    return "layout/shell";
  }

  @GetMapping("/old-students/{yearKey}/edit/{idx}")
  String oldStudentEditForm(@PathVariable String yearKey, @PathVariable int idx, Model model) {
    String normalized = yearKey.replace("-", " ").trim();
    List<Map<String, String>> rows = OLD_STUDENTS_DATA.get(normalized);
    if (rows == null || idx < 0 || idx >= rows.size()) {
      throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Old student row not found");
    }
    model.addAttribute("pageTitleKey", "page.oldStudents.title");
    model.addAttribute("activeNav", "oldStudents");
    model.addAttribute("oldStudentYears", OLD_STUDENT_YEAR_KEYS);
    model.addAttribute("selectedOldStudentYear", normalized);
    Map<String, String> editRow = rows.get(idx);
    populateOldStudentFormModel(
        model,
        normalized,
        editRow.get("university"),
        editRow.get("department"),
        editRow.get("nationality"));
    model.addAttribute("editRowIndex", idx);
    model.addAttribute("editRow", editRow);
    model.addAttribute("contentTemplate", "pages/old-student-edit");
    return "layout/shell";
  }

  @PostMapping("/old-students/{yearKey}/edit/{idx}")
  String oldStudentEditSubmit(
      @PathVariable String yearKey,
      @PathVariable int idx,
      @org.springframework.web.bind.annotation.RequestParam("name") String name,
      @org.springframework.web.bind.annotation.RequestParam("university") String university,
      @org.springframework.web.bind.annotation.RequestParam("department") String department,
      @org.springframework.web.bind.annotation.RequestParam("passport") String passport,
      @org.springframework.web.bind.annotation.RequestParam("email") String email,
      @org.springframework.web.bind.annotation.RequestParam("phone") String phone,
      @org.springframework.web.bind.annotation.RequestParam("nationality") String nationality,
      RedirectAttributes redirectAttributes) {
    String normalized = yearKey.replace("-", " ").trim();
    List<Map<String, String>> rows = OLD_STUDENTS_DATA.get(normalized);
    if (rows == null || idx < 0 || idx >= rows.size()) {
      throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Old student row not found");
    }
    String validationError = validateOldStudentFields(name, passport, university, department, nationality);
    if (validationError != null) {
      redirectAttributes.addFlashAttribute("oldStudentErrorKey", validationError);
      return "redirect:/old-students/" + normalized.replace(" ", "-") + "/edit/" + idx;
    }
    rows.set(idx, oldStudentRow(name, university, department, passport, email, phone, nationality));
    redirectAttributes.addFlashAttribute("oldStudentSuccessKey", "oldStudents.flash.updated");
    return "redirect:/old-students/" + normalized.replace(" ", "-");
  }

  private static final List<String> OLD_STUDENT_YEAR_KEYS =
      List.of(
          "2019 2020",
          "2020 2021",
          "2021 2022",
          "2022 2023",
          "2023 2024",
          "2024 2025",
          "2025 2026");

  private static final Map<String, List<Map<String, String>>> OLD_STUDENTS_DATA = buildOldStudentsData();

  private static Map<String, List<Map<String, String>>> buildOldStudentsData() {
    Map<String, List<Map<String, String>>> data = new HashMap<>();
    data.put(
        "2019 2020",
        new ArrayList<>(
            List.of(
                oldStudentRow("Hussein Alhari", "GELISIM", "Dental Prosthetics Technology", "012787991", "nona98_16@hotmail.com", "5418619189", "syria"),
                oldStudentRow("Kasem Al Masri", "GELISIM", "architecture", "013178283", "kasimmasri67@gmail.com", "53866172", "syria"),
                oldStudentRow("Ahmad Alhai Yehya", "GELISIM", "Dental Prosthetics Technology", "N012644151", "ahmad.alhaiyehya@gmail.com", "5316526580", "syria"),
                oldStudentRow("ibrahim haou", "GELISIM", "Physiotherapy", "5623052", "ibra947hamo@gmail.com", "5348806730", "syria"),
                oldStudentRow("IBRAHIM DENY", "OKAN", "MECHATRONICS ENG", "LR1561725", "", "", "LEBANON"),
                oldStudentRow("Sobhy Abdalla Sobhy ABUJAHAL", "BEYKENT", "Architecture", "N4877251", "", "5070077822", "PALESTAIN"),
                oldStudentRow("AHMED A. J. MOUSA", "USKUDAR", "Biology and Genetics", "N4657003", "", "", "PALESTAIN"),
                oldStudentRow("AHMED ABUFAYED", "USKUDAR", "Bioengineering", "T162675", "", "5314321789", "JORDAN /PALESTAIN"),
                oldStudentRow("AHMAD MOHAMMED AHMAD SALAMEH", "AYDIN", "MAKINE MUHENDISLIGI", "T494742", "", "", "JORDAN/PALESTAIN"),
                oldStudentRow("OSAMA JASIM ABDULMAJEED MAHAMED", "BAU", "architecture", "p03652207", "osama1372000@gmail.com", "582185847", "SUDAN"),
                oldStudentRow("OSAMA ALHELA", "USKUDAR", "SoftwareEngineering", "P02119579", "", "", "SUDAN"),
                oldStudentRow("ALAA MUSTAFA ZMAGOUT", "ALTINBAS", "Architecture", "C36KG7G", "", "", "LIBYA"),
                oldStudentRow("SHAHED MUSTAFA MZAGOUT", "ALTINBAS", "Interior Architecture", "GJ1VHRR8", "", "", "LIBYA"),
                oldStudentRow("NOURHAN MUSTAFA ALFALOUS", "MARMARA", "DATA SCINCE", "AA039026", "Nourhan.Mustafa101@gmail.com", "00218 92 229 4476", "LIBYA"),
                oldStudentRow("YOUSEF ALIDMAR", "USKUDAR", "SoftwareEngineering", "0996364", "", "799701205", "JORDAN"),
                oldStudentRow("Nouraldeen Ibrahim Fahid Hamdan", "BEYKENT", "BusinessAdministration", "P684024", "algaisy86@gmail.com", "791323341", "JORDAN"),
                oldStudentRow("NADA MOHAMMED MAHMOUD ALY ELTORGUMAN", "BEYKENT", "architect", "A20798950", "MTORGUMAN@GMAIL.COM", "96599619890", "EGYPT"),
                oldStudentRow("alaaeddin a h hamada", "BEYKENT", "DILLER", "N4631318", "", "", "PALESTAIN"),
                oldStudentRow("azmi jamal abdel rahman amoori", "bilgi", "international trade", "T462658", "", "5365195218", "JORDAN/PALESTAIN"),
                oldStudentRow("leen louy modi yosef rabieh", "AYDIN", "Business Administration", "P691393", "", "", "JORDAN"),
                oldStudentRow("ABDALLA MALIK ABDALLA ADAM", "bilgi", "MUHASEBE", "P02455285", "", "9627 8859 5512", "SUDAN"),
                oldStudentRow("ALBRARA OSAMA ABDULKAREEM ALMASHAWKHI", "IGU", "Physiotherapy", "P00122849", "", "9,66567E+11", "EGYPT/PALESTAIN"),
                oldStudentRow("ABDULMAJEED JASIM ABDULMAJEED ANABREES", "ALTINBAS", "Business Administration", "P05584454", "abdulmajeedjaism9@icloud.com", "5550112299", "SUDAN"),
                oldStudentRow("Mahmoud S. A. Adem", "BAU", "POLITICAL SCIENCE", "N4699228", "", "", "PALESTAIN"),
                oldStudentRow("Bilal F-Saghi", "BEYKENT", "Computer Engineering", "N546815", "", "", "LEBANON"),
                oldStudentRow("QUSAI YAD ISHAQHOROUB", "BEYKENT", "CIVIL ENG", "T1268252", "", "537 305 34 26", "JORDAN"),
                oldStudentRow("BARA MUSAID MAHIR", "USKUDAR", "ElectronicsEngineering", "N389487", "", "5050588246", "JORDAN /PALESTAIN"),
                oldStudentRow("RIDWAN MAHIR SALIM RABAH", "BAU", "BUSINESS", "P04550470", "", "552 215 51 99", "SUDAN/PALESTAIN"),
                oldStudentRow("SUHIB MOHAMMAD SULEIMAN ALZEER", "ALTINBAS", "Computer Engineering", "T278746", "", "", "JORDAN/PALESTAIN"),
                oldStudentRow("ELYAS ALHASHAMI", "USKUDAR", "International Relations", "X089043", "", "9,66555E+11", "SAUDI ARABIA"),
                oldStudentRow("SALAHALDIN.S.ADEM", "", "", "N4360211", "aadem8605@gmail.com", "5050022003", "PALESTAIN"))));
    data.put(
        "2020 2021",
        new ArrayList<>(
            List.of(
                oldStudentRow("AHMED S. M. ABUSABHA", "ALTINBAS", "International Trade", "N4568304", "", "", "PALESTAIN"),
                oldStudentRow("OSAMA ADEL DAKHIL ALSARDI", "ALTINBAS", "Mechanical Engineering", "N487836", "", "", "JORDAN"),
                oldStudentRow("AHMED N. F ABUGHALI", "USKUDAR", "Bioengineering (English)", "N4961804", "", "", "PALESTAIN"),
                oldStudentRow("ASMAA A. JAAL NAQYEL MHDWI", "USKUDAR", "Computer Engineering (English)", "P776889", "", "", "JORDAN"),
                oldStudentRow("ismail nabeel ismail abu shalbak", "BAU", "software engineering", "T498771", "Mabushalbak98@gmail.com", "", "JORDAN"),
                oldStudentRow("yousef younis ismail abu shalbak", "BAU", "International Trade", "T345212", "Abushalbakyousef2002@gmail.com", "", "JORDAN"),
                oldStudentRow("ESEEL KESHEN", "GELISIM", "ARCHITECTURE", "Q026597", "", "", "JORDAN"),
                oldStudentRow("HASAN AL-HUSSEIN", "ALTINBAS", "Electrical and Electronics Engineering", "E59806", "", "", "LEBANON"),
                oldStudentRow("Anas Ahmad Taleb Akhatib", "bilgi", "Mechatronics Engineering", "N284808", "", "", "JORDAN"),
                oldStudentRow("AYA NUSIRAT", "OKAN", "MEDICINE (ENGLISH)", "P34283541", "", "", "PALESTAIN"),
                oldStudentRow("SHAMS MERAR", "OKAN", "MEDICINE (ENGLISH)", "P39530703", "", "", "PALESTAIN 48"),
                oldStudentRow("BAYAN BO YONIS", "BAU", "International Trade", "P34461665", "", "", "PALESTAIN 48"),
                oldStudentRow("HUSAM S. A. ALHEEB", "ALTINBAS", "international Trade", "N4534003", "", "", "PALESTAIN"),
                oldStudentRow("AMER YOUNIS AHMAD ALOMARI", "NISANTASI", "International Relations (English)", "P999174", "", "", "JORDAN"),
                oldStudentRow("SHAMS S. H. MANASSRA", "USKUDAR", "Midwifery (MASTER DEGREE)", "N4852346", "", "", "PALESTAIN"),
                oldStudentRow("OMAR DWAEIKTA", "GELISIM", "NURSING (ENGLISH)", "N4930624", "", "", "PALESTAIN"),
                oldStudentRow("MARAH AMOOMI", "GELISIM", "NEW MEDIA AND COMMUNICATION(Full Time)", "N2979239", "", "", "PALESTAIN"),
                oldStudentRow("DANA GHANAMA", "USKUDAR", "Chemical engineering", "323119156", "", "", "PALESTAIN 48"),
                oldStudentRow("TAHANI AHMED", "ALTINBAS", "Orthodontics - Masters (With Thesis)", "K81N9R9P", "", "", "libya"),
                oldStudentRow("FOUAD K. M. ABUALROB", "USKUDAR", "Electrical-Electronics Engineering(English)", "N4937486", "", "", "PALESTAIN"),
                oldStudentRow("Abderrahmane El Moughrabi", "bilgi", "Business Administration", "X391000", "", "", "TUNISIA"),
                oldStudentRow("Wajd A. D NATSHEH", "biruni", "DENTISTRY (ENGLISH)", "N4576726", "", "", "PALESTAIN"),
                oldStudentRow("MARYAM ADEL ABU ALFATTAH SHEHADEH", "OKAN", "Dentistry", "0283001", "", "", "JORDAN"),
                oldStudentRow("LUNA ALAGHA", "ALTINBAS", "Computer Engineering", "N011845302", "", "", "SYRIA"),
                oldStudentRow("HIBATALLA SEIFIDDIN SHAHIN", "istinye", "NEW MEDIA (ENGLISH)", "P34507393", "", "", "Norway-GAZA"),
                oldStudentRow("Sama Beesi (M.) AlAqadi", "bilgi", "Architecture", "N3501362", "", "", "PALESTAIN"),
                oldStudentRow("Hala A. AMASH", "ALTINBAS", "Medicine", "P31957673", "", "", "PALESTAIN"),
                oldStudentRow("MIRAL A.TYAGHMOUR", "ALTINBAS", "Architecture", "N5027708", "", "", "PALESTAIN"),
                oldStudentRow("AZMI NAEETH AZMI SHAWER", "ALTINBAS", "Dentistry", "T384241", "", "", "JORDAN"),
                oldStudentRow("DANIA MAJDI FATHI UFI", "USKUDAR", "Bioengineering", "N4429492", "", "", "PALESTAIN"),
                oldStudentRow("SALSABEL EM GETMAVI", "ALTINBAS", "Dentistry", "S503832", "", "", "libya"),
                oldStudentRow("NADA NDOUAL HOSSIIN EMRAN", "AYDIN", "Medicine", "0121527", "nadamoran39@gmail.com", "5525126987", "JORDAN /PALESTINE"),
                oldStudentRow("DANA HASAN KHALIL IBRAHIM", "medipol", "MEDICINE (ENGLISH)", "T388786", "", "", "JORDAN"),
                oldStudentRow("RAWAN A. A. SHAHEN", "medipol", "MEDICINE (ENGLISH)", "N4668908", "", "", "PALESTAIN"),
                oldStudentRow("JIHAD HUSEIN", "bilgi", "international Trade and Business", "P33581941", "", "", "PALESTAIN 48"),
                oldStudentRow("AWNT. I. F. MAHMOUD", "ALTINBAS", "Mechanical Engineering", "N4503652", "", "", "PALESTAIN"),
                oldStudentRow("FARIHA NAQVI", "ALTINBAS", "Master in Business Administration (MBA)", "AV9397871", "", "", "PAKISTAN"),
                oldStudentRow("LAIYLA YASSER YOUSEF HAMATTO", "OKAN", "MEDICINE (ENGLISH)", "0571939", "", "", "JORDAN"),
                oldStudentRow("LAYTH SAHBAN ALI ELGHAZZAR", "ALTINBAS", "International Trade", "RZOR6CJ", "", "", "libya"),
                oldStudentRow("LATITH. A.NAJJAR", "GELISIM", "Mechanical Engineering", "N5044340", "", "", "PALESTINE"),
                oldStudentRow("Adlah A.M. Abedainabi", "bilgi", "Energy Systems Engineering", "T355725", "", "", "JORDAN /PALESTINE"),
                oldStudentRow("SHAHID B.A.HASLMOUN", "USKUDAR", "Molecular Biology and Genetics (English)", "N506463", "", "", "Nursing"),
                oldStudentRow("GHITH AL-HOMSI", "AYDIN", "graphic design", "0147841", "Alhomsighaith116@gmail.com", "", "JORDAN"),
                oldStudentRow("NAYYAN NAEIF S ALASHMARI", "OKAN", "Medicine", "01449474", "", "", "QATAR"),
                oldStudentRow("ABDULRAHMAN NAIF S ALSHMARI", "istinye", "Medicine", "01252075", "", "", "QATAR"),
                oldStudentRow("SHALAH FAWWAZ SHALAN AL-ABYAN", "BAU", "ELECTRICAL AND ELECTRONICS ENGINEERING", "A10640998", "", "", "IRAQ"),
                oldStudentRow("Dareen Osama Abdel Hafez Shwiki", "bilgi", "Nursing", "T320273", "", "", "JORDAN /PALESTINE"),
                oldStudentRow("ABDULMAJID M. A. SHAHEEN", "biruni", "Dentistry", "N4668658", "aboudshaheen123@gmail.com", "", "PALESTAIN"),
                oldStudentRow("Mahran Titi", "bilgi", "Film and Television", "P30975651", "", "", "PALESTAIN 48"),
                oldStudentRow("Zein I. S. Bitar", "BAU", "INDUSTRIAL ENGINEERING", "N4002850", "zainbitar97@gmail.com", "90 552 498 72 40", "PALESTAIN"),
                oldStudentRow("MAJD BASMI YOUSEF WAKED", "ALTINBAS", "Computer Engineering", "T294327", "", "", "JORDAN /PALESTINE"),
                oldStudentRow("AMAL K. M. DARWISH", "AREL", "Nutrition", "N4686345", "", "", "PALESTAIN"),
                oldStudentRow("TIBA QUSAY AHIMEDTAWFEEQ AL-GALANI", "ALTINBAS", "Master-Information Technologies", "A10335907", "", "", "IRAQ"),
                oldStudentRow("FAISAL RASHID SAID ABUSHARKH", "biruni", "Medicine", "P00024889//UJ21690989", "", "", "EGYPT -PALESTINE-TURKISH"),
                oldStudentRow("LIDIA DREBRI", "ALTINBAS", "Medicine", "186317074", "", "", "ALGERIA"),
                oldStudentRow("FIRAS SAYED", "GELISIM", "Architecture", "34456584", "", "", "PALESTAIN 48"),
                oldStudentRow("MARAWAN SAYAD", "GELISIM", "Architecture", "34222311", "", "", "PALESTAIN 48"),
                oldStudentRow("NEDAL AL TAKHEL", "AYDIN", "Architecture", "108-19-L010655", "", "", "SYRIA"),
                oldStudentRow("MCHRI SADIKOV", "AYDIN", "Architecture", "A0976208", "", "9,05339E+11", "CYPRUS"),
                oldStudentRow("Harwan Noodfal Hasan Al-Aghbari", "bilgi", "Mechanical Engineering", "7624333", "haroonagbari74@gmail.com", "5075730000", "YEMEN"),
                oldStudentRow("ABDUL RAHMAN SUKAR", "ALTINBAS", "Dentistry", "N201488291", "sokardahom@gmail.com", "9,66503E+11", "SYRIA"),
                oldStudentRow("MOHAMMED S. B. ALTOUBASI", "USKUDAR", "Dental Technology", "N5026946", "", "", "PALESTAIN"),
                oldStudentRow("MOUSA M. M. TOUBASI", "USKUDAR", "Dental Technology", "N5026944", "", "", "PALESTAIN"),
                oldStudentRow("OMAR YUSRI NAZIM SALAH", "ALTINBAS", "Jewelry Design", "T463489", "OMAR7693683@GMAIL.COM", "9,72598E+11", "JORDAN /PALESTINE"),
                oldStudentRow("MOHAMMED KHALED NAZMI SALAH", "ALTINBAS", "Jewelry Design", "T1036991", "", "", "JORDAN /PALESTINE"),
                oldStudentRow("ALI ABU SBEIH", "USKUDAR", "industrial engineering", "0135078", "", "", "JORDAN"),
                oldStudentRow("IBRAHIM ADNAN AL SOHT", "USKUDAR", "industrial engineering", "Q212969", "", "", "JORDAN"),
                oldStudentRow("ALMONTASER BELLAH SAEED ALJAIWEY", "USKUDAR", "Software Engineering", "Q152980", "montaser.jawii@yahoo.com", "9,62795E+11", "JORDAN"),
                oldStudentRow("ZAINUDEIN WAEL AHMAD AL KHALID", "bilgi", "Mechatronics Engineering", "0831863", "zen.edem@gmail.com", "9,62799E+11", "JORDAN"),
                oldStudentRow("ZAKARIA ZAKARIA NASSER EIDEEN", "AYDIN", "GASTRONOMY AND CULINARY ARTS", "4837163", "zakari.nasserideen@gmail.com", "5,52368E+10", "palestine"),
                oldStudentRow("Ehsanullah Ahsmji", "AYDIN", "COMPUTER ENGINEERING", "P03064825", "ehsanullahhashim12014@GMAIL.COM", "5,52601306E+09", "afghanistan"),
                oldStudentRow("Ahmad Diler Ahmad Mwwash", "bilgi", "Mechatronics Engineering", "N542757", "", "", "JORDAN"),
                oldStudentRow("Sara DALIA", "KULTUR", "master international relations", "Q909192", "sdalia858@gmail.com", "9,62796E+11", "JORDAN"),
                oldStudentRow("AHMAD ErA", "ALTINBAS", "Computer Engineering", "P000951348", "mxnet_palestine2000@gmail.com", "961 81956601", "SYRIA"),
                oldStudentRow("Asmaa la Rbe", "ALTINBAS", "Medicine", "RSC000", "", "", "JORDAN"),
                oldStudentRow("IMAN HARMOUCH", "ALTINBAS", "Dentistry", "LR1855531", "", "", "LEBANON"),
                oldStudentRow("MOHAMMAD JEBRIL", "Yeditepe", "physics", "N5198517", "", "", "palestine"),
                oldStudentRow("MOHAMMAD DALY", "ALTINBAS", "Computer Engineering", "LR1821838", "hamodydly@hotmail.com", "7 12313 145", "LEBANON"),
                oldStudentRow("mohamad Zerzour", "ALTINBAS", "Software Engineering", "LR1843678", "", "9,66553E+11", "LEBANON"),
                oldStudentRow("HAMZA M. S. HAMMAD", "USKUDAR", "Computer Engineering", "NS083221", "Woroodhameed80@gmail.com", "9,725E+11", "palestine"),
                oldStudentRow("IBRAHIM AL HAIRI", "GELISIM", "Dentistry", "N013960792", "", "", "SYRIA"),
                oldStudentRow("AHMED OMAR", "GELISIM", "BUSINESS ADMINISTRATION", "06786174", "", "", "YEMEN"),
                oldStudentRow("KASEM L. MASRI", "GELISIM", "Architecture(English)", "13178283", "KASIMMASRI67@GMAIL.COM", "5,38661E+12", "SYRIA"),
                oldStudentRow("ABDULAZIZ C. ALJIRAJ", "USKUDAR", "Nursing", "N5027211", "ABEDALJIRAJ@GMAIL.COM", "501146468", "palestine"),
                oldStudentRow("MOUSA L. A. REFIE", "USKUDAR", "Computer Engineering", "NS026623", "", "", "Palestine"),
                oldStudentRow("ZAKARIA ABUMIRAH", "USKUDAR", "NURSING", "NS027613", "", "", "palestine"),
                oldStudentRow("Fares abu MOUSA", "AYDIN", "FOOD ENGINEERING", "N4824236", "", "9,71526E+11", "Palestine"),
                oldStudentRow("IKRAN OSGIN", "GELISIM", "Psychology", "P0077628", "", "", "SOMAL"),
                oldStudentRow("Loreen Nader Mahmoud Malhi", "Maltepe", "Medicine", "T478493", "LAUREN.MAL40@GMAIL.COM", "9,72508E+11", "JORDAN /PALESTINE"),
                oldStudentRow("YARA MAHMOUD MASARWA", "Okan", "Medicine", "P34508146", "", "", "palestine 48"),
                oldStudentRow("AREEN NANO", "ALTINBAS", "Medicine", "30494658", "Arreen.neme.19@gmail.com", "9,72508E+11", "palestain 48"),
                oldStudentRow("HASAN ALI", "ALTINBAS", "Computer Engineering", "22612629", "Hasan.ALTI19@hotmail.com", "9,72051E+12", "PALESTAIN 48"),
                oldStudentRow("HUSSEIN MOUSA", "AYDIN", "Medicine", "A1894501", "M.HBAB555@MAIL.COM", "9,66556E+11", "EGYPT"),
                oldStudentRow("AYAHI ALHASHMOUN", "istinye", "MEDICINE", "T150297", "aya-alhashmou@hotmail.com", "9,72595E+11", "PALESTAIN"),
                oldStudentRow("Khalid Elrar", "bilgi", "international Trade and Business", "P1002914", "", "", "PALESTAIN 48"),
                oldStudentRow("Zakia Orab", "AYDIN", "POLITICAL SCIENCE AND INTERNATIONAL RELATIONS", "P32128058", "", "", "PALESTAIN 48"),
                oldStudentRow("MOHAMMAD H. M. ALDWEK", "USKUDAR", "Software Engineering", "NS027643", "orabi561@gmail.com", "9,72592E+11", "palestine"),
                oldStudentRow("mohammed imad", "USKUDAR", "medical engineering", "N3965558", "", "", "palestine"),
                oldStudentRow("hamse ahmed yasin", "medipol", "Physiotherapy", "P00626739", "", "", "SOMAL"),
                oldStudentRow("Shahid Natour", "bilgi", "Psychology", "p3188110", "", "", "PALESTAIN 48"),
                oldStudentRow("Abdallah E Tarek", "KULTUR", "BUSINESS ADMINISTRATION", "LR1799093", "abdallah.turk81@hotmail.com", "96171780081", "LEBANON"),
                oldStudentRow("MALHAM MOUD DABE", "Biruni", "Medicine", "A17241132", "", "", "IRAQ"),
                oldStudentRow("Hanan AL-RAHABI", "AYDINS", "MASTER ENGLISH", "3261899", "Hana.j.alrahabi@gmail.com", "+967 777 884 882", "YEMN"),
                oldStudentRow("HAYTHAM LUIS", "ALTINBAS", "international Logistics Management", "A58198413", "Haytamlim13?@gmail.com", "76300011", "MOROCO"),
                oldStudentRow("OTHORR CHMUS JOE", "USKUDAR", "Cyber Security", "A1084623", "", "", "NIGERIA"),
                oldStudentRow("Abdulrahman ALKALKAS", "biruni", "Medicine", "N 012589569", "", "9,66506E+11", "Syria"),
                oldStudentRow("ABDULLAH SALIH MUALAFYA", "USKUDAR", "Software Engineering", "A10554824", "mrakalz4@hotmail.com", "", "NIGERIA"),
                oldStudentRow("ABDISHAKUR . M HUMEI", "USKUDAR", "Radio, Television and Cinema (Turkish)", "P00671747", "", "", "SOMAL"),
                oldStudentRow("ABDILLAHMAN WARSAMAH", "ISHK", "ELECTRICAL Engineering", "P00198251", "", "96650764741", "SOMAL"),
                oldStudentRow("CHUKWUMA. G OBIAJUNA", "USKUDAR", "Elderly Care Services", "B0079268", "", "", "NIGERIA"),
                oldStudentRow("SARA AHMED MOHAMED NAIZY", "AYDIN", "Dentistry", "A16421965", "sara.n.aizy@gmail.com", "10207078", "LEBANON"),
                oldStudentRow("NAZEA AGHFAP BATDOWIE", "USKUDAR", "Electrical-Electronics Engineering", "A26995890", "Mazen.amir2011@yahoo.com", "102915975", "EGYPT"),
                oldStudentRow("LUC KEMEGNE NGANISO", "USKUDAR", "Molecular Biology and Genetics", "894977", "", "", "CAMEROON"),
                oldStudentRow("MOHAMMAD ABUJADEH", "Arel", "Economics and Administrative Sciences", "N4931679", "", "", "PALESTAIN"),
                oldStudentRow("MOMINIQ adisa", "Bilgi", "Business Administration", "3130384", "Mm9046725@gmail.com", "9,05326E+11", "PALESTAIN 48"),
                oldStudentRow("ABDERAHIME ABDELOUAHAS", "ALTINBAS", "Logistics Management", "OU712987", "Abderahimabdelouahab8@gmail.com", "661298378", "MOROCO"),
                oldStudentRow("MONCEF EMAL", "ALTINBAS", "Cinema and Television", "LFO927341", "", "6,28636828", "MOROCO"),
                oldStudentRow("AID AL ALI KHALED ESWANI", "USKUDAR", "Molecular Biology and Genetics", "39644335", "TURBOMONCOFO7@GMAIL.COM", "", "PALESTAIN 48"),
                oldStudentRow("DINA HASSAN ALY", "AYDIN", "English literature", "A20846380", "", "", "EGYPT"),
                oldStudentRow("FRANK IDRIS OSCHE", "OKAN", "PhD in Business Administration", "A08349564", "frankochs55@gmail.com", "9,71508E+11", "NIGERIA"),
                oldStudentRow("CHUKWAMA. G OBIAJUNA", "USKUDAR", "MASTER IN international relations", "B00079268", "", "", "NIGERIA"),
                oldStudentRow("ABDURRGSA . DINDABI", "USKUDAR", "Software Engineering", "A10858356", "", "", "NIGERIA"),
                oldStudentRow("ISMAEL SURAU", "USKUDAR", "POLITICAL SCIENCE", "G1568447", "", "", "GHANA"),
                oldStudentRow("MOINIR B.N OWA", "AYDIN", "MASTER IN CIVIL ENGINEERING", "A1820357", "", "", "PALESTINE"),
                oldStudentRow("ALIAA MYS. AL-SAGHILI", "AYDIN", "Business Administration", "N4600361", "alsaal.sheikhly@gmail.com", "944 770 346 994", "IRAQ"),
                oldStudentRow("mohammad shahrour", "AYDIN", "Cinema and Television", "T495761", "mohammadaim1996@hotmail.com", "5,94308E+11", "JORDAN / PALISTINE"),
                oldStudentRow("DJAIMI ALAMI", "OKAN", "TURKISH", "153018149", "", "", "ALGERIA"),
                oldStudentRow("AHMED HAYTHAM ELTANTAWY", "ATILIM", "MechatronicsEngineering", "A12395654-P00E17398", "", "", "EGYPT-KOSOVO"),
                oldStudentRow("Ahmed A. el kurd", "AYDIN", "PHD- BUSSNESS", "N459854", "ahkurd@gmail.com", "9,62791E+11", "Palestine"),
                oldStudentRow("IBRAHIM HAMOU", "istinye", "PHYSIOTHERAPY AND REHABILITATION", "003-10-L022962", "ibra97hama@gmail.com", "9,0532E+11", "Syria"),
                oldStudentRow("LANA MUSTAFA M ZAQOUT", "BAU", "ARCHITECTURE", "C36KD67G", "", "", "libya"),
                oldStudentRow("SAMIA MUHAMED HASSAOUT", "bilgi", "NUTRITION AND DIETETICS", "JN977TNC", "", "", "libya"),
                oldStudentRow("SOHBI ABUALHLEL", "GELISIM", "PHYSICAL THERAPY AND REHABILITATION", "N4877251", "", "", "palestine"),
                oldStudentRow("Abdurahman Othman Murshed Bin Mahfodh", "bilgi", "Mechatronics Engineering", "6477761", "", "96503364372", "YEMEN"),
                oldStudentRow("OSAMA KADER", "bilgi", "Mechatronics Engineering", "0673051", "", "", "JORDAN"),
                oldStudentRow("Khoodor B. Mdhoun", "bilgi", "Genetics and Bioengineering", "525676", "", "", "LEBANON"),
                oldStudentRow("Reess. K. Abutaha", "bilgi", "Mechatronics Engineering", "N4479189", "raestah6@gmail.com", "96892831045", "palestine"),
                oldStudentRow("ANAS TAHA QATAMI", "AYDIN", "MASTER IN mechanical engineering", "Q216659", "Anasalqata1m18@gmail.com", "7,82646E+09", "JORDAN"),
                oldStudentRow("Muslih hamou", "bilgi", "Mechatronics engineering", "030-10092706", "monehamo@gmail.com", "9,62768E+11", "Syria"),
                oldStudentRow("Mahmoud S.A. Subaia", "bilgi", "Gastronomy and Culinary Arts", "N5010586", "abwyslymhwnd16@gmail.com", "5,59379E+08", "Palestine"),
                oldStudentRow("Salah Khaled Saif El Isaimi", "bilgi", "Computer Engineering", "P397087", "SALOUK.K.S.NS@GMAIL.COM", "", "JORDAN"),
                oldStudentRow("Basel. Ziad Odah", "medipol", "Anesthesiology", "T739362", "AN.BASELO8@GMAIL.COM", "9,05394E+11", "JEMEN"),
                oldStudentRow("EHSAN EL HEDIL", "medipol", "International Trade", "N4686918", "ehsamnmbh@gmail.com", "5,38644E+11", "PALESTINE"),
                oldStudentRow("ANES HESHAM HASSAN DALLOUL", "medipol", "Medicine", "R0000057", "", "", "ST KHITS"),
                oldStudentRow("AHMED MOSLEH", "USKUDAR", "Software Engineering", "M211111", "AHMAD.MSLEH-MOHAMMAD11@GMAIL.COM", "5,58452E+09", "palestine"),
                oldStudentRow("EZELDIN OSSAMA MOHAMED WAHBA", "USKUDAR", "Software Engineering", "A6442579", "", "", "EGYPT"),
                oldStudentRow("MOHAMMAD MAHMOUD SAEED ALSHARAWI", "USKUDAR", "Electronics Engineering", "03813884", "", "", "JORDAN"),
                oldStudentRow("AHEER B. N. ELSHRAFII", "bilgi", "MASTER IN Physiotherapy and REHABILITATION", "7435653", "", "", "JORDAN"),
                oldStudentRow("Mohammed F.Y. Alghjban", "USKUDAR", "PHD IN Psychology", "N4624145", "", "9,70592E+11", "palestine"),
                oldStudentRow("ANAS O.F. ABER", "BAU", "MASTER IN project management", "N6824135", "", "", "palestine"),
                oldStudentRow("MALMOUK. S. A AER", "BAU", "global affairs", "N4693282", "dvlammouadam@gmail.com", "9,0552E+11", "palestine"),
                oldStudentRow("ADEL KHALED . Q AAMAR", "BAU", "Software Engineering", "A1603254", "Adel.hesber899@gmail.com", "9,83256E+11", "JORDAN"),
                oldStudentRow("TAWFIQ MUNEER TAWFIQ ABU AL ROB", "OKAN", "Medicine", "0478505", "", "", "JORDAN"),
                oldStudentRow("MARIAM ALTEY HABSAIN Eltetar", "NISANTASI", "Gastronomy and Culinary Arts (Turkish)", "4382588", "H.atityi73@gmail.com", "9,65978E+11", "palestine"),
                oldStudentRow("Fatima Atteya Hassan Elbettar", "NISANTASI", "Aviation Management (Turkish)", "4382587", "H.atityi73@gmail.com", "9,65978E+11", "palestine"),
                oldStudentRow("Khaled ABUALQARE", "bilgi", "Computer Engineering", "N6484015", "", "", "palestine"),
                oldStudentRow("Mohammed Zuhair Adnan Mohammed", "bilgi", "Electrical and Electronic Engineering", "P048H8049", "Mostafa.adnanhassan2000@gmail.com", "9,66551E+11", "SUDAN"),
                oldStudentRow("Mostafa Hassan", "bilgi", "Gastronomy and Culinary Arts", "P3266904", "", "9,72509E+11", "PALESTAIN 48"),
                oldStudentRow("OSAMA HAMAD ABDEL KARIM AL-TAYMOUNI", "NISANTASI", "Sports Trainer Education (Turkish)", "03819774", "", "", "JORDAN"),
                oldStudentRow("ASHRAF NABEL ISMAIL SHERQAT", "ALTINBAS", "Civil Engineering", "T484492", "", "", "JORDAN /PALESTINE"),
                oldStudentRow("OMAM A-HOSHME ABOUDAHMEED AL-KENDI", "ALTINBAS", "MASTER IN CIVIL ENGINEERING", "P07740630", "", "", "YEMEN"),
                oldStudentRow("ANNAH M. A MATEER", "AYDIN", "MASTER IN POLITICAL SCIENCE AND INTERNATIONAL RELATIONS", "N466166", "", "", "palestine"),
                oldStudentRow("Feras Ali Hasan Qawasmeh", "AYDIN", "MASTER IN POLITICAL SCIENCE AND INTERNATIONAL RELATIONS", "N4831679", "ferasaligawasmeh@gmail.com", "5,81967294E+09", "palestine"),
                oldStudentRow("Khubrih Yousif AI-AUbud", "AYDIN", "master of business management", "P506592", "Al.mutaiahigh@outlook.sa", "0091 562 445 0304", "JORDAN"),
                oldStudentRow("ABED RAHMAN KARIM", "USKUDAR", "MASTER IN Computer Engineering", "P0026451", "Abed.krayem798@gmail.com", "9613269472", "LEBANON /PALESTINE"),
                oldStudentRow("NAWRAS FASHAFSHEH", "USKUDAR", "PHD IN NURSING", "T1073849", "", "", "JORDAN /PA"),
                oldStudentRow("RAYIM MUITHANSA SARI AL-SAMMARAIE", "OKAN", "MASTER IN Power Electronics and Clean Energy Systems", "A11000735", "Reaym.n.alsubri@gmail.com", "7740500173", "IRAQ"),
                oldStudentRow("DUNA Abosads", "AYDIN", "master of audiology", "N5066496", "Altatasdudau@gmail.com", "9,72598E+11", "palestine"),
                oldStudentRow("ISSA ALSAFADI", "GELISIM", "MASTER OF Business administration", "0234382", "", "", "JORDAN"),
                oldStudentRow("JEHAD ZALLOUM", "USKUDAR", "Software Engineer", "N5077840", "", "", "Palestine"),
                oldStudentRow("MOHAMMAD OUDI", "USKUDAR", "master in Cyber Security", "N397676", "", "", "JORDAN"),
                oldStudentRow("MALIK MAHMOUUD EL AL BRIDIS", "ALTINBAS", "Cinema and Television", "T314912", "", "5,95984E+11", "JORDAN /PALESTINE"),
                oldStudentRow("MELLOUK MAHMOUD TALA AL IDRIES", "ALTINBAS", "Interior Architecture and Environmental Design", "T315986", "", "", "JORDAN /PALESTINE"),
                oldStudentRow("BARA RAHEED BAHATEH AB...", "ALTINBAS", "", "P369788", "", "", "JORDAN"))));
    data.put(
        "2021 2022",
        new ArrayList<>(
            List.of(
                oldStudentRow("ahmad abutaha", "Bahçeşehir", "Mechatronics", "5193829", "Ahmadabutaha321", "5528554567", "palestine"),
                oldStudentRow("lina shaghnoubi", "Nişantaşı", "Electrical and Electronics Engineering", "Q455190", "", "", "jordan"),
                oldStudentRow("dina shaghnoubi", "Nişantaşı", "", "", "", "", "jordan"))));
    data.put("2022 2023", new ArrayList<>(build2022_2023Rows()));
    data.put("2023 2024", new ArrayList<>());
    data.put("2024 2025", new ArrayList<>());
    data.put("2025 2026", new ArrayList<>());
    return data;
  }

  /** Rows transcribed from the provided 2022-2023 spreadsheet (part 1). */
  private static List<Map<String, String>> build2022_2023Rows() {
    List<Map<String, String>> rows = new ArrayList<>();
    rows.add(oldStudentRow("MERAL NAJDAT MOHAMMEDALI", "BILGI", "CINEMA AND TELEVIZYON", "A18336482", "", "", "IRAQ"));
    rows.add(oldStudentRow("HAITHAM HABASHIE", "BILGI", "ELEKTRIK ENG", "23578292", "", "", "PALESTINE"));
    rows.add(oldStudentRow("HAMZA HAMMAD", "BILGI", "ELEKTRIK ENG", "N5085221", "", "", "PALESTINE"));
    rows.add(oldStudentRow("REMA ASLI", "BILGI", "Architecture EN", "35052343", "", "9.72526E+11", "PALESTINE 48"));
    rows.add(oldStudentRow("YEHIA MOHAMMAD", "ISU", "physical therapy", "31585302", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("MOSTAFA SHEHAB IZZAT ADHAMI", "ISU", "SOFTWEAR ENG", "T1106874", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("OBADA M. W. BARGHOUTHI", "ISU", "SOFTWEAR ENG", "4967133", "", "", "PALESTINE"));
    rows.add(oldStudentRow("LUJAIN YASSER MOHAMMED ELDESOUKI", "ISU", "Architecture", "P00264624", "", "", "EGYPTIAN"));
    rows.add(oldStudentRow("YOUSEF MOHAMMAD YOUSEF SALAMEH", "ISU", "NURSING", "T1245064", "", "9.72527E+11", "JORDANIAN"));
    rows.add(oldStudentRow("RUBA MOHAMMED ABDULHAMEED", "ISU", "BIOMEDICAL ENG", "7740628", "", "", "YEMEN"));
    rows.add(oldStudentRow("YOUSEF ZETAWY", "ISU", "architecture", "32363249", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("BASSAM ASHRAF BASSAM MARAQA", "GELISIM", "CIVIL ENG", "T1243905", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("MUHAMAD JABAREEN", "ISU", "Architecture", "35050905", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("MOHAMMAD NAZIEH MOHAMMAD HAMDAN", "ISU", "mecular genatic", "T1121945", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("MOHAMMAD ZUHAIR", "OKAN", "ELEKTRIK ENG", "P04858049", "", "", "SUDAN"));
    rows.add(oldStudentRow("LAREEN QASEM", "OKAN", "Architecture EN", "35639805", "", "9.72532E+11", "PALESTINE 48"));
    rows.add(oldStudentRow("MAHDI SULTAN", "OKAN", "Architecture EN", "35730719", "", "97252774838", "PALESTINE 48"));
    rows.add(oldStudentRow("ABDEL RAHMAN AMJAD EMRAN SALHAB", "OKAN", "NURSING EN", "T1088458", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("SAID ATAMLA", "OKAN", "MEDICIN EN", "34661129", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("ATAALLA MOHAMED ABDELATI MOUSTAFA", "OKAN", "DENTISTRY EN", "A20617775", "", "", "EGYPTIAN"));
    rows.add(oldStudentRow("HEBATALLA MOHAMED ABDELATI MOUSTAFA", "OKAN", "MEDICIN EN", "A20617417", "", "", "EGYPTIAN"));
    rows.add(oldStudentRow("ANAS ANWER ABUSARA", "OKAN", "SOFTWEAR ENG", "T1216385", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("MOHAMMAD OSAMA SOUD BADER", "OKAN", "NURSING EN", "T1055384", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("OMAR WESAM Z. J. SUBLOUBAN", "OKAN", "phisical therapy", "R068942", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("MOHAMED SHEIKHA", "OKAN", "SOFTWEAR ENG", "34750595", "", "", "PALESTINE 48"));
    rows.add(
        oldStudentRow(
            "HASSEN AHMED MOHAMEDNOUR",
            "OKAN",
            "SOFTWEAR ENG",
            "K0426401",
            "hasseahmed@stu.okan.edu.tr",
            "",
            "Eritrea"));
    rows.add(oldStudentRow("TALA ABU AL ROB", "OKAN", "Logistics Management", "Q694710", "", "", "JORDANIAN"));
    rows.add(
        oldStudentRow(
            "MOHAMMAD NAJATI ABDEL MUHSEN ABU ZAROUR",
            "OKAN",
            "Electrical & Electronics Engineering",
            "P921241",
            "",
            "",
            "JORDANIAN"));
    rows.add(oldStudentRow("ALEEN MANSOUR", "OKAN", "Architecture EN", "24380526", "", "9.72524E+11", "PALESTINE 48"));
    rows.add(oldStudentRow("LAITH ANAN ABDEL KARIM SALAH", "OKAN", "COMPUTER ENG", "P055511", "", "", "JORDANIAN"));
    rows.add(
        oldStudentRow(
            "AHMAD O. A. ORABI", "OKAN", "Electrical & Electronics Engineering", "N4816284", "", "", "PALESTINE"));
    rows.add(oldStudentRow("OSAMA ALSMADI", "OKAN", "COMPUTER ENG", "N014530270", "", "", "SYRIAN"));
    rows.add(oldStudentRow("ABD ALRAHMAN FAWZI SIAG", "OKAN", "SOFTWEAR ENG", "T1243659", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("SHAHD MASRI", "OKAN", "bioengineering", "34983586", "", "5349597906", "PALESTINE 48"));
    rows.add(oldStudentRow("FERAS SABER HUSNI ABU AL HASAN", "OKAN", "COMPUTER ENG", "T1263693", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("YAHIA MAHMOUD ABDELAZIZ BANAT", "OKAN", "BUSSINES", "Q209292", "", "05313862038", "JORDANIAN"));
    rows.add(oldStudentRow("ISMAIL KHADER ISMAIL SALLOUM", "OKAN", "BUSSINES", "T1136966", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("ACHRAF SALOUAQUI", "OKAN", "BUSSINES", "WP1985078", "", "", "Morocco"));
    rows.add(oldStudentRow("LIM(ROLA) MASHARKA", "ALTINBAS", "DENTISITRY EN", "33353900", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("MOHAMMED A. M. HAMADA", "ALTINBAS", "marketing arch", "N5065038", "", "", "PALESTINE"));
    rows.add(oldStudentRow("TASNEEM KIYAM", "ALTINBAS", "MEDICIN EN", "34601740", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("OMAR A. M. HAMADA", "ALTINBAS", "SOFTWEAR ENG", "N5065159", "", "", "PALESTINE"));
    rows.add(oldStudentRow("MAHMOUD HAMZAH", "ALTINBAS", "industrial eng", "PR0279074", "", "", "Lebanon"));
    rows.add(oldStudentRow("ADEL KHALED FARID ASAD", "BAU", "ANIMITION", "Q430056", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("MOHAMMED SAYED AHMED ELSAYED", "BAU", "AI ENG", "P06112687", "", "", "SUDAN"));
    rows.add(oldStudentRow("MOHAMAD DOUREID", "BAU", "MECHATRONICS ENG", "F56940", "", "", "Lebanon"));
    rows.add(oldStudentRow("OBADA ADNAN MAHMOUD KOKAZ", "USKUDAR", "INDUSTRIAL ENG", "0733691", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("RAKAN AKRAM ZOHDI JAKHLAB", "USKUDAR", "INTERIOR DESIGN", "P368187", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("SARA KHALED AYED MAJD", "USKUDAR", "CHEMICAL ENG", "Q613057", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("RAMI MARWAN MAHMOUD ODEH", "USKUDAR", "software eng", "Q519287", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("RANEEM ALMABHOUH", "USKUDAR", "DENTISITRY TR", "N4782757", "", "", "PALESTINE"));
    rows.add(oldStudentRow("DUNIA AHMAD DAOUD KANAAN", "USKUDAR", "biotechnology", "P546628", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("IBRAHIM KHALIL FAYAD", "USKUDAR", "software eng", "N4819040", "", "", "PALESTINE"));
    rows.add(oldStudentRow("ABDALLA MAHMOUD ABDALLA", "NISANTASI", "aviation managment", "RA013125", "", "", "Dominica"));
    rows.add(oldStudentRow("KENAN K. T. ABUEED", "NISANTASI", "Business Administration", "N5309242", "", "", "PALESTINE"));
    rows.add(oldStudentRow("MOHAMMAD ABDALLAH ABED ALFATTAH ATIEH", "NISANTASI", "computer eng", "T1225244", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("AHMED A. H. JARADAT", "NISANTASI", "foreign trade", "N5109601", "", "", "PALESTINE"));
    rows.add(oldStudentRow("HUSAIN ABU TAIR", "NISANTASI", "civil eng", "24050060", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("HUSSEIN E. H. RABEE", "NISANTASI", "political sciense", "A0025608", "", "", "PALESTINE"));
    rows.add(oldStudentRow("MAHMOUD MAHAMID", "AYDIN", "Business Administration", "23944817", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("ALIREZA SAFDARI", "MEDIPOL", "First aid and emergency", "P02459131", "", "", "AFGHANISTAN"));
    rows.add(
        oldStudentRow(
            "ABDEL RAHMAN BILAL AL-RAHMAN SHARQAWI",
            "GELISIM",
            "logistic managment",
            "P468413",
            "a.sharqawi96@gmail.com",
            "9.6278E+11",
            "JORDANIAN"));
    rows.add(oldStudentRow("MOHAMAD ABU YONIS", "ALTINBAS", "Architecture EN", "35107156", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("ABDALLAH GUGA", "USKUDAR", "MEDICIN EN", "32292056", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("SOHAIB Z. A. DANDIS", "ALTINBAS", "PHARMACY", "409583614", "", "", "PALESTINE"));
    rows.add(oldStudentRow("SAEED ZAID QAID", "bilgi gelisim", "FILM AND TELEVISION", "7737619", "", "", "YEMEN"));
    rows.add(oldStudentRow("NUHA HUSNI", "ISTANBUL TICARET", "BUSINESS", "N011899974", "", "", "SYRIAN"));
    rows.add(oldStudentRow("ABDELRAHMAN H. H. ALMASSRI", "OKAN AYDIN", "pilotage", "N4180380", "", "", "PALESTINE"));
    rows.add(oldStudentRow("NIHAYA SALEM AWADALLA", "OKAN", "nutrition", "566350418", "", "", "USA"));
    rows.add(
        oldStudentRow(
            "IZZ UD DIN KHALED FARID ASAD",
            "registered from another ofis",
            "INTERNATIONAL TRADE",
            "Q430058",
            "",
            "",
            "JORDANIAN"));
    rows.add(oldStudentRow("ABDEL RAHMAN EMAD SABRI ZAZA", "ALTINBAS", "software eng", "Q344392", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("ALAA A.H. ALSAHLI", "AREL", "mechanical eng", "N4878100", "", "", "PALESTINE"));
    rows.add(oldStudentRow("TAWHEED M.S. HAMMAD", "ALTINBAS OKAN", "MEDICIN EN", "N5328958", "", "", "PALESTINE"));
    rows.add(oldStudentRow("KHALED MAHMOUD SAEED ALSHAIRAWI", "OSTIM ALTINBAS", "business", "Q699035", "", "", "JORDANIAN"));
    rows.add(
        oldStudentRow(
            "DOAA RAMADANI",
            "OKAN USKUDAR",
            "artificial intelligence",
            "307260296",
            "doaaramadani2001@gmail.com",
            "",
            "ALGERIENNE"));
    rows.add(oldStudentRow("JAD ALLAH ALI ISHAQ ALNATSHEH", "OKAN", "INTERIOR DESIGN EN", "NO INFO", "", "", "NO INFO"));
    rows.add(oldStudentRow("YAZAN AMIR AHMAD HASHIMEH", "OKAN", "Medicin", "T1049384", "", "", "JORDANIAN"));
    rows.add(
        oldStudentRow(
            "ABDALLAH MOH'D ABDUL JALIL TOUBAH",
            "HALIC BAU IGU",
            "medicin software eng",
            "P568405",
            "",
            "",
            "JORDANIAN"));
    rows.add(oldStudentRow("AMAR YASSIR BASHIR HASSAN", "OKAN BILGI BAU", "business", "P08797670", "", "", "SUDAN"));
    rows.add(oldStudentRow("RAHAF MAHMOUD ABDEDALAZIZ MISHAEL", "BAU", "pharmaceutical medicine", "NO INFO", "", "", "NO INFO"));
    rows.add(oldStudentRow("ISSA A. J. ABUESHESH", "NISANTASI", "busnis administration", "N5595489", "", "", "Palestine"));
    rows.add(oldStudentRow("MOHAMMAD A. K. ALKHALIDI", "OKAN", "mechatronics eng", "N4877086", "", "", "palestine"));
    rows.add(oldStudentRow("RANIA ADI", "ALTINBAS", "software eng", "N006247210", "", "", "SYRIAN"));
    rows.add(oldStudentRow("IBRAHIM H. I. ABUALKAS", "ALTINBAS", "software eng", "N5393542", "", "", "palestine"));
    rows.add(oldStudentRow("MAHMOUD ABOTOAME", "OKAN", "Architecture EN", "324005297", "", "", "palestine 48"));
    rows.add(oldStudentRow("OSAMA MAHMOUD ABDELAZIZ BANAT", "ISU", "busnis administration", "Q381829", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("MOHAMMAD ALOBAID", "GELISIM", "dental technology", "N006034669", "", "", "SYRIAN"));
    rows.add(oldStudentRow("AZMI AMORI", "NISANTASI", "mangment Info system", "T462658", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("QUSAI IYAD ISHAQ HOROUB", "OKAN", "civil eng", "T1268252", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("LAITH ANWER MOHAMMAD ALZBOUN", "OKAN", "civil eng", "T1092729", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("NIKOL UDA", "OKAN", "Dentistry", "34562635", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("AHMED ALI SALEH ALI", "OKAN", "computer eng", "10415713", "", "", "YEMEN"));
    rows.add(oldStudentRow("NOFEL ABDULJABAR SHAMAL", "ISU", "physical therapy", "A11561670", "", "", "IRAQ"));
    rows.add(oldStudentRow("ADAM AMER", "OKAN", "medicine", "32360956", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("GHAZAL SHIRALI", "BILGI", "gaming design", "X53220049", "", "", "IRAN"));
    rows.add(oldStudentRow("JAD ALLAH ALI ISHAQ ALNATSHEH", "OKAN", "BUSINESS", "NO INFO", "", "", "NO INFO"));
    rows.add(oldStudentRow("AMEER MUHANNAD IZZGHAYER", "OKAN", "BUSINESS", "721028510", "", "", "USA"));
    rows.add(oldStudentRow("MAEN JIHAD M. AL-HROUB", "gelisim okan", "economic and finans", "Q519803", "", "", "JORDANIAN"));
    rows.add(
        oldStudentRow(
            "FAISAL RAUF S ALBARGHOUTHY", "BAU", "MOLECULAR BIO AND GENETICS", "2033057", "", "", "KSA"));
    rows.add(oldStudentRow("AHMAD SULTAN", "OKAN TRANSFER", "MEDICIN", "35454095", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("DONIA HAJ", "OKAN", "MEDICIN", "32099582", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("ABDALLAH ABU RKEEK", "ISU", "MEDICIN", "32639304", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("DIKRIAT ABU RKEEK", "ISU", "MEDICIN", "32637965", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("RASHA ASSI", "BAU", "SOFTWARE ENG", "35079582", "", "", "PALESTINE 48"));
    rows.add(
        oldStudentRow(
            "MORAD ( ABDALLAH ) ABD EL RAHIM",
            "halic",
            "business administration",
            "34933141",
            "",
            "",
            "PALESTINE 48"));
    rows.add(oldStudentRow("MAHMOD ALZBARGAH", "bilgi", "civil eng", "35450137", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("HOSAM RAYYAN", "BILGI", "civil eng", "33902667", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("MUHAMMAD KARIM GABARIN", "NISANTASI", "Civil eng", "35159825", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("KHALED MUSTAFA", "okan altinbas", "civil eng", "33409366", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("AHMED A.M. ALSARAHNA", "altinbas", "dental health", "N5631332", "", "", "PALESTINE"));
    rows.add(oldStudentRow("MOHAMMED SALIH", "gelisim", "civil eng", "P05523932", "", "", "SUDAN"));
    rows.add(oldStudentRow("BANEEN ATIYAH", "OKAN", "MEDICIN", "A15749386", "", "", "IRAQ"));
    rows.add(oldStudentRow("Mouafo NGOUYAMSA", "USKUDAR", "MEDICIN", "NO INFO", "", "", "NO INFO"));
    rows.add(
        oldStudentRow(
            "SAMA MOHAMED MOHAMED SAYED AHMED AZAB",
            "gelisim",
            "arcticure",
            "A29143856",
            "",
            "",
            "EGYPTIAN"));
    rows.add(oldStudentRow("NORAN NAIM", "bilgi", "nutrition", "33247361", "", "", "PALESTINE 48"));
    rows.add(
        oldStudentRow(
            "ABDELFATTAH KHALED ALWAILED AMER", "okan", "MEDICIN", "J38F3J7K", "", "", "LIBYA"));
    rows.add(oldStudentRow("FENNANE NOUHAYLA", "okan", "Foreign Trade", "OC4908953", "", "", "Morocco"));
    rows.add(oldStudentRow("FADIA ALMOKADAM", "okan", "Foreign Trade", "N015716496", "", "", "SYRIAN"));
    rows.add(
        oldStudentRow("OMAR HAMADE", "okan", "Foreign Trade", "4256260", "ohemade@stu.okan.edu.tr", "", "LEBANON"));
    rows.add(oldStudentRow("MOUNA AMATULLAH", "okan", "Foreign Trade", "NO INFO", "", "", "NO INFO"));
    rows.add(
        oldStudentRow(
            "MUDHAFFER MAHMOUD ABEDALAZIZ BANAT",
            "okan",
            "busnis administration",
            "NO INFO",
            "",
            "",
            "NO INFO"));
    rows.add(oldStudentRow("ASMAE EL BADAOUI", "altinbas", "Anesthesia", "FH4802845", "", "", "Morocco"));
    rows.add(oldStudentRow("ENSHIRAH HADER", "ALTINBAS", "MEDICIN", "31452038", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("HANA HAJ YAHYA", "ALTINBAS", "MEDICIN", "35360552", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("ABDALLAH R. M. ABUMOUSA", "ALTINBAS", "DENTISTRY EN", "N4824227", "", "", "PALESTINE"));
    rows.add(oldStudentRow("MOHAMMED M.B. ZARIFA", "Bilgi", "International trade", "N5111129", "", "", "PALESTINE"));
    rows.add(oldStudentRow("MOLOUK MAHMOUD TALAB EDRIES", "gelesim", "Arch eng tr", "T1134345", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("ALI M.A. ASAFRA", "ticaret", "new media", "A0025619", "", "", "PALESTINE"));
    rows.add(
        oldStudentRow(
            "FAREED SAMEER FAREED AL-SAYID",
            "Nisantasi",
            "business administration",
            "T1011608",
            "",
            "",
            "JORDANIAN"));
    rows.add(oldStudentRow("ELAF SALLAH", "Nisantasi", "Computer Engineering", "9254194", "", "", "SYRIAN"));
    rows.add(oldStudentRow("SARA KHATTAB", "Nisantasi", "Computer Engineering", "7658923", "", "", "SYRIAN"));
    rows.add(
        oldStudentRow(
            "BILAL ODAY SAEED", "nisantasi", "business administration", "A17816189", "", "", "IRAQ"));
    rows.add(oldStudentRow("NAI MANSOUR", "okan", "DENTISTRY EN", "34607581", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("NADA MASARWA", "okan", "MEDICIN", "34367312", "", "", "PALESTINE 48"));
    rows.add(
        oldStudentRow(
            "AHMED A.A. ABUSAMRA",
            "uskudar",
            "Electrical and Electro Eng",
            "N5516253",
            "",
            "",
            "PALESTINE"));
    rows.add(
        oldStudentRow(
            "OUBAI ABDULNASER YUSUF ABDULLA ALMAHMEED",
            "ALTINBAS",
            "DENTISTRY EN",
            "2949562",
            "",
            "",
            "BAHRAIN"));
    rows.add(
        oldStudentRow("AHMAD KAREM", "BEYKOZ ALTINBAS", "Software eng", "NO INFO", "", "", "NO INFO"));
    rows.add(oldStudentRow("HADIL KHALED AHMED", "altinbas", "DENTISTRY EN", "9389118", "", "", "YEMEN"));
    rows.add(oldStudentRow("MALAK ADEL MOHAMMED", "nisantasi", "software eng", "7876454", "", "", "YEMEN"));
    rows.add(
        oldStudentRow(
            "FARIS YASER ABDEL-FATTAH EL-AWAMLEH", "okan", "DENTISTRY EN", "Q698518", "", "", "JORDANIAN"));
    rows.add(oldStudentRow("RIHAN A.K ALZATARI", "altinbas", "Software eng", "N5255414", "", "", "PALESTINE"));
    rows.add(
        oldStudentRow(
            "ABDULLAH ALI AYASH",
            "Istanbul Atlas University",
            "Nursing",
            "11470839",
            "",
            "",
            "YEMEN"));
    rows.add(
        oldStudentRow(
            "ANAS ALI AYASH MAGMLY",
            "Istanbul Atlas University",
            "Nursing",
            "11470840",
            "",
            "",
            "YEMEN"));
    rows.add(
        oldStudentRow(
            "SANDRA M. A. ABUEED",
            "gedik",
            "international relation",
            "noletter000207720",
            "sasha.djaber@hotmail.com",
            "00962 0799101818",
            "PALESTINE"));
    rows.add(
        oldStudentRow(
            "HAMZA M. T. ABUGHALIA", "nisantasi", "international trade", "408610285", "", "", "PALESTINE"));
    rows.add(
        oldStudentRow("ALRASHID RASHID ALRASHID OMAR", "okan", "aviation managment", "P10080879", "", "", "SUDAN"));
    rows.add(
        oldStudentRow(
            "RAHMEH MOHAMMAD ALI HIJAZI",
            "AYDEN BAU okan",
            "MARKETING",
            "9982004426",
            "monerahijazi@gmail.com",
            "962773000000",
            "JORDANIAN"));
    rows.add(oldStudentRow("ZINA RABIEA", "okan", "MEDICIN TR", "24095765", "", "", "PALESTINE 48"));
    rows.add(oldStudentRow("FAISAL HASSAN MAHMOUD MADY", "arel", "Busniess", "P00253135", "", "", "PALESTINE"));
    rows.add(oldStudentRow("ALAA MOHAMED DJIBRIL MAHAMAT", "okan", "nursing", "RB8546540", "", "", "TCHAD"));
    rows.add(oldStudentRow("KHALED M.A. DALOUL", "ayden", "industrial eng", "N5319097", "", "", "PALESTINE"));
    rows.add(oldStudentRow("KAHLAN MOHAMMED AHMED", "kent", "health care", "10367398", "", "", "YEMEN"));
    rows.add(oldStudentRow("YAHYA A. F. SAHYOUN", "kent", "Health and Safety", "804686236", "", "", "PALESTINE"));
    rows.add(
        oldStudentRow(
            "LIYAN MOHAMAD NADER ABU HAMDAH",
            "medipol",
            "International Relations",
            "P307732",
            "",
            "",
            "JORDANIAN"));
    rows.add(
        oldStudentRow(
            "MOHANNAD RIZIK A.MAJEED AWADALLAH",
            "ayden",
            "health and Safety",
            "P073955",
            "",
            "",
            "JORDANIAN"));
    rows.add(
        oldStudentRow(
            "ABDAL-RAHMAN Y. M. ALOMARY", "nisantasi", "software eng", "420205080", "", "", "PALESTINE"));
    rows.add(
        oldStudentRow(
            "OSAMA MAHMOUD MOHAMMAD JABER", "GELISIM", "DENTAL", "Q341544", "", "05538388069", "JORDANIAN"));
    rows.add(
        oldStudentRow(
            "ABDALMANANE",
            "topkapi",
            "history",
            "RC6129100",
            "ABDLMANAELDRISS@GMAIL.COM",
            "23599572395",
            "TCHAD"));
    rows.add(oldStudentRow("SEIFEDDINE CHIBOUB", "ayden", "Architecture", "", "", "", ""));
    rows.add(
        oldStudentRow(
            "ALI ABDELRAHMAN ADAM RABIH",
            "gelisim",
            "biomedical eng / aeronautical eng",
            "",
            "",
            "",
            ""));
    rows.add(oldStudentRow("FAYEQ S. F. QANNITA", "nisantasi", "busnis adm", "", "", "", ""));
    rows.add(oldStudentRow("ABDULRAZIQ ALBASHEER HASAN", "ayden", "microbiology", "", "", "", ""));
    rows.add(oldStudentRow("AHMED K A", "ozyegn", "Business Administration", "", "", "", ""));
    rows.add(
        oldStudentRow(
            "AYMAN H.M. AMMAR", "ayden", "Electrical and electronic engineering", "", "", "", ""));
    rows.add(oldStudentRow("YAZAN A. A. FARRAJ", "altinbas", "computer eng", "", "", "", ""));
    rows.add(oldStudentRow("AHMED A.A. ELKURD", "nisantasi", "Business Administration", "", "", "", ""));
    return rows;
  }

  private void populateOldStudentFormModel(
      Model model,
      String selectedYear,
      String currentUniversity,
      String currentDepartment,
      String currentNationality) {
    model.addAttribute("oldStudentYears", OLD_STUDENT_YEAR_KEYS);
    model.addAttribute("selectedOldStudentYear", selectedYear);
    model.addAttribute(
        "oldStudentUniversityOptions",
        mergeOldStudentOption(currentUniversity, oldStudentUniversityOptions()));
    model.addAttribute(
        "oldStudentDepartmentOptions",
        mergeOldStudentOption(currentDepartment, oldStudentDepartmentOptions()));
    model.addAttribute(
        "nationalityOptions",
        NationalityCatalog.sortedDisplayNames());
    model.addAttribute("selectedOldStudentNationality", currentNationality == null ? "" : currentNationality);
  }

  private static List<String> mergeOldStudentOption(String current, List<String> base) {
    TreeSet<String> merged = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
    merged.addAll(base);
    String normalized = safeVal(current);
    if (!normalized.isEmpty()) {
      merged.add(normalized);
    }
    return new ArrayList<>(merged);
  }

  private List<String> oldStudentUniversityOptions() {
    TreeSet<String> options = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
    universityRepository.findAllByOrderByNameAsc().stream()
        .map(University::getName)
        .map(PageController::safeVal)
        .filter(s -> !s.isEmpty())
        .forEach(options::add);
    collectOldStudentFieldValues("university").forEach(options::add);
    return new ArrayList<>(options);
  }

  private List<String> oldStudentDepartmentOptions() {
    TreeSet<String> options = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
    departmentRepository.findAllByOrderByNameAsc().stream()
        .map(Department::getName)
        .map(PageController::safeVal)
        .filter(s -> !s.isEmpty())
        .forEach(options::add);
    collectOldStudentFieldValues("department").forEach(options::add);
    return new ArrayList<>(options);
  }

  private Set<String> collectOldStudentFieldValues(String field) {
    return OLD_STUDENTS_DATA.values().stream()
        .flatMap(List::stream)
        .map(row -> row.getOrDefault(field, ""))
        .map(PageController::safeVal)
        .filter(s -> !s.isEmpty())
        .collect(Collectors.toCollection(() -> new TreeSet<>(String.CASE_INSENSITIVE_ORDER)));
  }

  private static String normalizeOldStudentYear(String yearKey) {
    if (yearKey == null) {
      return "";
    }
    return yearKey.replace("-", " ").trim();
  }

  private static String validateOldStudentFields(
      String name,
      String passport,
      String university,
      String department,
      String nationality) {
    if (safeVal(name).isEmpty()) {
      return "oldStudents.flash.nameRequired";
    }
    if (safeVal(passport).isEmpty()) {
      return "oldStudents.flash.passportRequired";
    }
    if (safeVal(university).isEmpty()) {
      return "oldStudents.flash.universityRequired";
    }
    if (safeVal(department).isEmpty()) {
      return "oldStudents.flash.departmentRequired";
    }
    if (safeVal(nationality).isEmpty()) {
      return "oldStudents.flash.nationalityRequired";
    }
    return null;
  }

  private static Map<String, String> oldStudentRow(
      String name,
      String university,
      String department,
      String passport,
      String email,
      String phone,
      String nationality) {
    Map<String, String> row = new HashMap<>();
    row.put("name", safeVal(name));
    row.put("university", safeVal(university));
    row.put("department", safeVal(department));
    row.put("passport", safeVal(passport));
    row.put("email", safeVal(email));
    row.put("phone", safeVal(phone));
    row.put("nationality", safeVal(nationality));
    return row;
  }

  private static String safeVal(String value) {
    return value == null ? "" : value.trim();
  }

}
