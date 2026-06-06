package com.ingazgate.crm.lead.service;

import com.ingazgate.crm.lead.entity.Lead;
import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadType;
import com.ingazgate.crm.lead.repository.LeadRepository;
import com.ingazgate.crm.student.Student;
import com.ingazgate.crm.student.StudentApplication;
import com.ingazgate.crm.student.StudentApplicationRepository;
import com.ingazgate.crm.student.StudentRepository;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.user.AppUserRepository;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Service
public class LeadStudentSyncService {
  private static final Logger log = LoggerFactory.getLogger(LeadStudentSyncService.class);

  private final LeadRepository leadRepository;
  private final StudentRepository studentRepository;
  private final StudentApplicationRepository applicationRepository;
  private final AppUserRepository appUserRepository;

  public LeadStudentSyncService(
      LeadRepository leadRepository,
      StudentRepository studentRepository,
      StudentApplicationRepository applicationRepository,
      AppUserRepository appUserRepository) {
    this.leadRepository = leadRepository;
    this.studentRepository = studentRepository;
    this.applicationRepository = applicationRepository;
    this.appUserRepository = appUserRepository;
  }

  @EventListener(ApplicationReadyEvent.class)
  public void backfillUnlinkedLeads() {
    try {
      backfillAll();
    } catch (Exception ex) {
      log.warn("Lead backfill skipped or failed: {}", ex.getMessage());
    }
  }

  @Transactional
  public void backfillAll() {
    List<Lead> unlinked = leadRepository.findByStudentIsNull();
    for (Lead lead : unlinked) {
      syncFromLead(lead);
      leadRepository.save(lead);
    }
    if (!unlinked.isEmpty()) {
      log.info("Backfilled {} leads with student/application records", unlinked.size());
    }
  }

  @Transactional
  public void syncFromLead(Lead lead) {
    if (lead == null) {
      return;
    }
    AppUser owner = resolveWorkspaceOwner();
    OffsetDateTime now = OffsetDateTime.now();

    Student student = lead.getStudent();
    if (student == null) {
      student = findExistingStudent(owner.getId(), lead).orElse(null);
    }
    if (student == null) {
      student = new Student();
      student.setId(UUID.randomUUID());
      student.setOwnerUser(owner);
      student.setCreatedAt(lead.getCreatedAt() != null ? lead.getCreatedAt() : now);
    }
    applyLeadToStudent(lead, student, now);
    student = studentRepository.save(student);
    lead.setStudent(student);

    StudentApplication application = lead.getApplication();
    if (application == null) {
      application = new StudentApplication();
      application.setId(UUID.randomUUID());
      application.setOwnerUser(owner);
      application.setStudent(student);
      application.setApplicationNumber(nextApplicationNumber());
      application.setApplicationType(mapApplicationType(lead.getLeadType()));
      application.setItemsCount(0);
      application.setCreatedAt(lead.getCreatedAt() != null ? lead.getCreatedAt() : now);
    }
    applyLeadToApplication(lead, application, now);
    application = applicationRepository.save(application);
    lead.setApplication(application);
  }

  @Transactional
  public void syncLeadUpdate(Lead lead) {
    if (lead.getStudent() != null) {
      applyLeadToStudent(lead, lead.getStudent(), OffsetDateTime.now());
      studentRepository.save(lead.getStudent());
    }
    if (lead.getApplication() != null) {
      applyLeadToApplication(lead, lead.getApplication(), OffsetDateTime.now());
      applicationRepository.save(lead.getApplication());
    }
  }

  private void applyLeadToStudent(Lead lead, Student student, OffsetDateTime now) {
    student.setFullName(lead.getStudentName());
    student.setPhone(trimToNull(lead.getPhone()));
    student.setEmail(trimToNull(lead.getEmail()));
    student.setNationality(trimToNull(lead.getNationality()));
    student.setUpdatedAt(now);
  }

  private void applyLeadToApplication(Lead lead, StudentApplication application, OffsetDateTime now) {
    application.setStatus(mapApplicationStatus(lead.getStatus()));
    application.setApplicationType(mapApplicationType(lead.getLeadType()));
    application.setSemester(trimToNull(lead.getStudyYear()));
    application.setNotes(buildApplicationNotes(lead));
    application.setUpdatedAt(now);
  }

  private String buildApplicationNotes(Lead lead) {
    StringBuilder sb = new StringBuilder();
    if (StringUtils.hasText(lead.getNotes())) {
      sb.append(lead.getNotes().trim());
    }
    appendLine(sb, "Target university", lead.getTargetUniversity());
    appendLine(sb, "Desired major", lead.getDesiredMajor());
    appendLine(sb, "Current university", lead.getCurrentUniversity());
    appendLine(sb, "Current major", lead.getCurrentMajor());
    appendLine(sb, "Degree level", lead.getDegreeLevel());
    appendLine(sb, "Lead source", lead.getSource());
    return sb.isEmpty() ? null : sb.toString().trim();
  }

  private static void appendLine(StringBuilder sb, String label, String value) {
    if (!StringUtils.hasText(value)) {
      return;
    }
    if (!sb.isEmpty()) {
      sb.append('\n');
    }
    sb.append(label).append(": ").append(value.trim());
  }

  private java.util.Optional<Student> findExistingStudent(UUID ownerId, Lead lead) {
    if (StringUtils.hasText(lead.getPhone())) {
      List<Student> byPhone =
          studentRepository.findByOwnerUser_IdOrderByCreatedAtDesc(ownerId).stream()
              .filter(
                  s ->
                      lead.getPhone().trim().equalsIgnoreCase(String.valueOf(s.getPhone()).trim()))
              .toList();
      if (!byPhone.isEmpty()) {
        return java.util.Optional.of(byPhone.get(0));
      }
    }
    if (StringUtils.hasText(lead.getEmail())) {
      List<Student> byEmail =
          studentRepository.findByOwnerUser_IdOrderByCreatedAtDesc(ownerId).stream()
              .filter(
                  s ->
                      lead.getEmail().trim().equalsIgnoreCase(String.valueOf(s.getEmail()).trim()))
              .toList();
      if (!byEmail.isEmpty()) {
        return java.util.Optional.of(byEmail.get(0));
      }
    }
    return java.util.Optional.empty();
  }

  private AppUser resolveWorkspaceOwner() {
    List<AppUser> admins = appUserRepository.findStaffAdmins();
    if (!admins.isEmpty()) {
      return admins.get(0);
    }
    return appUserRepository
        .findAll()
        .stream()
        .findFirst()
        .orElseThrow(() -> new IllegalStateException("No workspace owner found for lead sync"));
  }

  private String nextApplicationNumber() {
    long seq = applicationRepository.nextApplicationNumber();
    return "IN-" + String.format("%06d", seq);
  }

  static String mapApplicationType(LeadType leadType) {
    if (leadType == LeadType.UNIVERSITY_TRANSFER) {
      return "TRANSFER";
    }
    return "NEW";
  }

  static String mapApplicationStatus(LeadStatus status) {
    if (status == null) {
      return "NEW";
    }
    return switch (status) {
      case IN_PROGRESS, CONTACTED, DOCUMENTS_PENDING -> "IN_PROGRESS";
      case APPLICATION_SUBMITTED -> "SUBMITTED";
      case ACCEPTED -> "ACCEPTED";
      case REJECTED -> "REJECTED";
      case CLOSED -> "WITHDRAWN";
      default -> "NEW";
    };
  }

  private static String trimToNull(String value) {
    if (!StringUtils.hasText(value)) {
      return null;
    }
    return value.trim();
  }
}
