package com.ingazgate.crm.web;

import com.ingazgate.crm.student.Student;
import com.ingazgate.crm.student.StudentApplication;
import com.ingazgate.crm.student.StudentApplicationRepository;
import com.ingazgate.crm.student.StudentRepository;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.springframework.data.domain.Pageable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

/**
 * IngazGate workspace lists with a safe fallback when stricter email-domain filters fail on older DBs.
 */
@Service
public class IngazgateWorkspaceQueryService {
  private static final Logger log = LoggerFactory.getLogger(IngazgateWorkspaceQueryService.class);

  private final StudentRepository studentRepository;
  private final StudentApplicationRepository studentApplicationRepository;

  public IngazgateWorkspaceQueryService(
      StudentRepository studentRepository,
      StudentApplicationRepository studentApplicationRepository) {
    this.studentRepository = studentRepository;
    this.studentApplicationRepository = studentApplicationRepository;
  }

  public List<Student> listIngazgateStudents() {
    try {
      return studentRepository.findIngazgateWorkspaceStudents();
    } catch (DataAccessException ex) {
      log.warn("IngazGate student list fallback (non-agent filter)", ex);
      return studentRepository.findNonAgentWorkspaceStudents();
    }
  }

  public List<String> distinctIngazgateSemesters() {
    try {
      return studentApplicationRepository.findDistinctSemestersIngazgate();
    } catch (DataAccessException ex) {
      log.warn("IngazGate semester list fallback", ex);
      return studentApplicationRepository.findDistinctSemestersAll();
    }
  }

  public List<StudentApplication> listIngazgateApplications(
      String status, String semester, UUID universityId, UUID programId) {
    try {
      return studentApplicationRepository.findIngazgateApplicationsFiltered(
          status, semester, universityId, programId);
    } catch (DataAccessException ex) {
      log.warn("IngazGate applications list fallback (non-agent filter)", ex);
      return studentApplicationRepository.findAllApplicationsFiltered(
          status, semester, universityId, programId);
    }
  }

  public long countStudentsCreatedSince(OffsetDateTime since) {
    try {
      return studentRepository.countIngazgateWorkspaceStudentsCreatedSince(since);
    } catch (DataAccessException ex) {
      log.warn("IngazGate student count fallback", ex);
      return studentRepository.countNonAgentWorkspaceStudentsCreatedSince(since);
    }
  }

  public long countApplicationsCreatedSince(OffsetDateTime since) {
    try {
      return studentApplicationRepository.countIngazgateApplicationsCreatedSince(since);
    } catch (DataAccessException ex) {
      log.warn("IngazGate application count fallback", ex);
      return studentApplicationRepository.countNonAgentApplicationsCreatedSince(since);
    }
  }

  public List<Student> recentStudents(Pageable pageable) {
    try {
      return studentRepository.findTop5IngazgateWorkspaceStudents(pageable);
    } catch (DataAccessException ex) {
      log.warn("IngazGate recent students fallback", ex);
      return studentRepository.findTop5NonAgentWorkspaceStudents(pageable);
    }
  }

  public List<StudentApplication> recentApplications(Pageable pageable) {
    try {
      return studentApplicationRepository.findRecentIngazgate(pageable);
    } catch (DataAccessException ex) {
      log.warn("IngazGate recent applications fallback", ex);
      return studentApplicationRepository.findRecentAll(pageable);
    }
  }
}
