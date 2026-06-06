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


}
