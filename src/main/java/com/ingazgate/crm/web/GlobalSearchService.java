package com.ingazgate.crm.web;

import com.ingazgate.crm.asset.Department;
import com.ingazgate.crm.asset.DepartmentRepository;
import com.ingazgate.crm.asset.University;
import com.ingazgate.crm.asset.UniversityRepository;
import com.ingazgate.crm.student.Student;
import com.ingazgate.crm.student.StudentApplication;
import com.ingazgate.crm.student.StudentApplicationRepository;
import com.ingazgate.crm.student.StudentRepository;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import com.ingazgate.crm.user.WorkspaceOwnershipService;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class GlobalSearchService {
  private static final int LIMIT = 5;

  private final AuthUsers authUsers;
  private final WorkspaceOwnershipService workspaceOwnershipService;
  private final StudentRepository studentRepository;
  private final StudentApplicationRepository studentApplicationRepository;
  private final AppUserRepository appUserRepository;
  private final DepartmentRepository departmentRepository;
  private final UniversityRepository universityRepository;
  private final MessageSource messageSource;

  public GlobalSearchService(
      AuthUsers authUsers,
      WorkspaceOwnershipService workspaceOwnershipService,
      StudentRepository studentRepository,
      StudentApplicationRepository studentApplicationRepository,
      AppUserRepository appUserRepository,
      DepartmentRepository departmentRepository,
      UniversityRepository universityRepository,
      MessageSource messageSource) {
    this.authUsers = authUsers;
    this.workspaceOwnershipService = workspaceOwnershipService;
    this.studentRepository = studentRepository;
    this.studentApplicationRepository = studentApplicationRepository;
    this.appUserRepository = appUserRepository;
    this.departmentRepository = departmentRepository;
    this.universityRepository = universityRepository;
    this.messageSource = messageSource;
  }

  public List<GlobalSearchHit> search(AppUser user, String query) {
    String q = query == null ? "" : query.trim();
    if (q.length() < 2 || user == null) {
      return List.of();
    }
    Locale locale = LocaleContextHolder.getLocale();
    List<GlobalSearchHit> hits = new ArrayList<>();
    boolean admin = authUsers.canManageAgents(user);
    UUID ownerId = admin ? null : workspaceOwnershipService.dataOwnerId(user);
    PageRequest page = PageRequest.of(0, LIMIT);

    List<Student> students =
        admin
            ? studentRepository.searchAllVisible(q, page)
            : studentRepository.searchForOwner(ownerId, q, page);
    for (Student s : students) {
      String subtitle = firstNonBlank(s.getPassportNo(), s.getEmail(), s.getPhone());
      hits.add(
          new GlobalSearchHit(
              "student",
              typeLabel("student", locale),
              safe(s.getFullName()),
              subtitle,
              "/students/" + s.getId()));
    }

    List<StudentApplication> applications =
        admin
            ? studentApplicationRepository.searchAllVisible(q, page)
            : studentApplicationRepository.searchForOwner(ownerId, q, page);
    for (StudentApplication a : applications) {
      String studentName =
          a.getStudent() != null && StringUtils.hasText(a.getStudent().getFullName())
              ? a.getStudent().getFullName().trim()
              : "";
      String subtitle = studentName;
      if (a.getDepartment() != null) {
        String prog = a.getDepartment().getName();
        String uni =
            a.getDepartment().getUniversity() != null
                ? a.getDepartment().getUniversity().getName()
                : "";
        if (StringUtils.hasText(uni) && StringUtils.hasText(prog)) {
          subtitle = uni + " — " + prog;
        } else if (StringUtils.hasText(prog)) {
          subtitle = prog;
        }
      }
      hits.add(
          new GlobalSearchHit(
              "application",
              typeLabel("application", locale),
              safe(a.getApplicationNumber()),
              subtitle,
              "/applications/" + a.getId()));
    }

    if (admin) {
      for (AppUser agent : appUserRepository.searchAgents(q, page)) {
        String title =
            StringUtils.hasText(agent.getOfficeName())
                ? agent.getOfficeName().trim()
                : safe(agent.getDisplayName());
        hits.add(
            new GlobalSearchHit(
                "agent",
                typeLabel("agent", locale),
                title,
                safe(agent.getEmail()),
                "/agents/" + agent.getId()));
      }
    }

    for (Department d :
        departmentRepository
            .searchPrograms(q, "", "", "", false, List.of(), page)
            .getContent()) {
      String uni = d.getUniversity() != null ? d.getUniversity().getName() : "";
      String title = StringUtils.hasText(uni) ? uni + " — " + d.getName() : safe(d.getName());
      hits.add(
          new GlobalSearchHit(
              "program",
              typeLabel("program", locale),
              title,
              firstNonBlank(d.getDegree(), d.getLanguage()),
              "/programs"));
    }

    for (University u : universityRepository.searchByTerm(q, page)) {
      hits.add(
          new GlobalSearchHit(
              "university",
              typeLabel("university", locale),
              safe(u.getName()),
              safe(u.getCountry()),
              "/universities/" + u.getId()));
    }

    return hits;
  }

  private String typeLabel(String key, Locale locale) {
    return messageSource.getMessage("search.type." + key, null, key, locale);
  }

  private static String safe(String value) {
    return value == null ? "" : value.trim();
  }

  private static String firstNonBlank(String... values) {
    if (values == null) {
      return "";
    }
    for (String v : values) {
      if (StringUtils.hasText(v)) {
        return v.trim();
      }
    }
    return "";
  }
}
