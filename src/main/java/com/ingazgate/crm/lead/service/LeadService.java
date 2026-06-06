package com.ingazgate.crm.lead.service;

import com.ingazgate.crm.lead.dto.LeadAssignmentHistoryResponse;
import com.ingazgate.crm.lead.dto.LeadDetailResponse;
import com.ingazgate.crm.lead.dto.LeadPageResponse;
import com.ingazgate.crm.lead.dto.LeadRequest;
import com.ingazgate.crm.lead.dto.LeadResponse;
import com.ingazgate.crm.lead.dto.LeadStatusHistoryResponse;
import com.ingazgate.crm.lead.dto.LeadUpdateRequest;
import com.ingazgate.crm.lead.entity.Employee;
import com.ingazgate.crm.lead.entity.Lead;
import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadStatusHistory;
import com.ingazgate.crm.lead.entity.LeadType;
import com.ingazgate.crm.lead.exception.AccessDeniedLeadException;
import com.ingazgate.crm.lead.exception.ResourceNotFoundException;
import com.ingazgate.crm.lead.exception.TelegramDeliveryException;
import com.ingazgate.crm.lead.mapper.LeadMapper;
import com.ingazgate.crm.lead.repository.LeadAssignmentHistoryRepository;
import com.ingazgate.crm.lead.repository.LeadRepository;
import com.ingazgate.crm.lead.repository.LeadStatusHistoryRepository;
import com.ingazgate.crm.lead.telegram.TelegramService;
import com.ingazgate.crm.user.AppUser;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Service
public class LeadService {
  private static final Logger log = LoggerFactory.getLogger(LeadService.class);

  private final LeadRepository leadRepository;
  private final LeadAssignmentHistoryRepository assignmentHistoryRepository;
  private final LeadStatusHistoryRepository statusHistoryRepository;
  private final AssignmentService assignmentService;
  private final TelegramService telegramService;
  private final TelegramNotificationFormatter notificationFormatter;
  private final LeadMapper leadMapper;
  private final EmployeeAccessService employeeAccessService;
  private final LeadNoteService leadNoteService;
  private final LeadStudentSyncService leadStudentSyncService;

  public LeadService(
      LeadRepository leadRepository,
      LeadAssignmentHistoryRepository assignmentHistoryRepository,
      LeadStatusHistoryRepository statusHistoryRepository,
      AssignmentService assignmentService,
      TelegramService telegramService,
      TelegramNotificationFormatter notificationFormatter,
      LeadMapper leadMapper,
      EmployeeAccessService employeeAccessService,
      LeadNoteService leadNoteService,
      LeadStudentSyncService leadStudentSyncService) {
    this.leadRepository = leadRepository;
    this.assignmentHistoryRepository = assignmentHistoryRepository;
    this.statusHistoryRepository = statusHistoryRepository;
    this.assignmentService = assignmentService;
    this.telegramService = telegramService;
    this.notificationFormatter = notificationFormatter;
    this.leadMapper = leadMapper;
    this.employeeAccessService = employeeAccessService;
    this.leadNoteService = leadNoteService;
    this.leadStudentSyncService = leadStudentSyncService;
  }

  @Transactional(readOnly = true)
  public List<LeadResponse> listLeads() {
    return leadRepository.findAllWithAssignedEmployee().stream().map(leadMapper::toResponse).toList();
  }

  @Transactional(readOnly = true)
  public LeadResponse getLead(UUID id) {
    return leadMapper.toResponse(requireLead(id));
  }

  @Transactional(readOnly = true)
  public LeadPageResponse getMyLeads(
      AppUser user,
      int page,
      int size,
      LeadStatus status,
      LeadType leadType,
      String search) {
    PageRequest pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "createdAt"));
    String q = StringUtils.hasText(search) ? search.trim() : null;
    Page<Lead> result;
    if (employeeAccessService.isAdmin(user)) {
      result = leadRepository.findAllLeads(status, leadType, q, pageable);
    } else {
      Employee employee = employeeAccessService.requireLinkedEmployee(user);
      result = leadRepository.findMyLeads(employee.getId(), status, leadType, q, pageable);
    }
    List<LeadResponse> items = result.getContent().stream().map(leadMapper::toResponse).toList();
    return new LeadPageResponse(
        items,
        result.getNumber(),
        result.getSize(),
        result.getTotalElements(),
        result.getTotalPages(),
        status,
        leadType,
        q);
  }

  @Transactional(readOnly = true)
  public LeadDetailResponse getMyLeadDetail(AppUser user, UUID id) {
    if (employeeAccessService.isAdmin(user)) {
      return getLeadDetail(id);
    }
    Employee employee = employeeAccessService.requireLinkedEmployee(user);
    Lead lead = requireLeadForEmployee(id, employee.getId());
    return buildDetailResponse(lead);
  }

  @Transactional(readOnly = true)
  public LeadDetailResponse getLeadDetail(UUID id) {
    Lead lead =
        leadRepository
            .findByIdWithEmployee(id)
            .orElseThrow(() -> new ResourceNotFoundException("Lead not found: " + id));
    return buildDetailResponse(lead);
  }

  @Transactional(readOnly = true)
  public List<LeadAssignmentHistoryResponse> getAssignmentHistory(UUID leadId) {
    requireLead(leadId);
    return assignmentHistoryRepository.findByLeadIdOrderByAssignedAtDesc(leadId).stream()
        .map(leadMapper::toHistoryResponse)
        .toList();
  }

  @Transactional(readOnly = true)
  public List<LeadStatusHistoryResponse> getStatusHistory(UUID leadId) {
    requireLead(leadId);
    return statusHistoryRepository.findByLeadIdOrderByChangedAtDesc(leadId).stream()
        .map(leadMapper::toStatusHistoryResponse)
        .toList();
  }

  @Transactional
  public LeadResponse createLead(LeadRequest request) {
    Lead lead = new Lead();
    lead.setId(UUID.randomUUID());
    applyRequest(lead, request);
    lead.setStatus(LeadStatus.NEW);
    lead.setCreatedAt(OffsetDateTime.now());
    lead = leadRepository.save(lead);

    leadStudentSyncService.syncFromLead(lead);
    lead = leadRepository.save(lead);

    Employee employee = assignmentService.assignLead(lead);
    lead.setAssignedEmployee(employee);
    changeStatus(lead, LeadStatus.IN_PROGRESS, null);
    lead = leadRepository.save(lead);

    notifyEmployee(lead, employee.getLastAssignedAt());
    return leadMapper.toResponse(lead);
  }

  @Transactional
  public LeadResponse createSampleLead() {
    return createLead(
        new LeadRequest(
            LeadType.REGISTRATION,
            "Ahmed Hassan",
            "+20123456789",
            "ahmed@example.com",
            "Egyptian",
            null,
            "Istanbul University",
            null,
            "Computer Engineering",
            "2",
            "Bachelor",
            "Interested in university registration in Istanbul.",
            "test-api"));
  }

  @Transactional
  public LeadResponse updateMyLead(AppUser user, UUID id, LeadUpdateRequest request) {
    Lead lead;
    Employee actor = null;
    if (employeeAccessService.isAdmin(user)) {
      lead =
          leadRepository
              .findByIdWithEmployee(id)
              .orElseThrow(() -> new ResourceNotFoundException("Lead not found: " + id));
      actor = employeeAccessService.findLinkedEmployee(user).orElse(null);
    } else {
      actor = employeeAccessService.requireLinkedEmployee(user);
      lead = requireLeadForEmployee(id, actor.getId());
    }
    applyUpdate(lead, request, actor);
    lead = leadRepository.save(lead);
    leadStudentSyncService.syncLeadUpdate(lead);
    return leadMapper.toResponse(leadRepository.save(lead));
  }

  private LeadDetailResponse buildDetailResponse(Lead lead) {
    UUID leadId = lead.getId();
    return new LeadDetailResponse(
        leadMapper.toResponse(lead),
        assignmentHistoryRepository.findByLeadIdOrderByAssignedAtDesc(leadId).stream()
            .map(leadMapper::toHistoryResponse)
            .toList(),
        leadNoteService.listNotes(leadId),
        statusHistoryRepository.findByLeadIdOrderByChangedAtDesc(leadId).stream()
            .map(leadMapper::toStatusHistoryResponse)
            .toList());
  }

  private void applyRequest(Lead lead, LeadRequest request) {
    lead.setLeadType(request.leadType());
    lead.setStudentName(request.studentName().trim());
    lead.setPhone(trimToNull(request.phone()));
    lead.setEmail(trimToNull(request.email()));
    lead.setNationality(trimToNull(request.nationality()));
    lead.setCurrentUniversity(trimToNull(request.currentUniversity()));
    lead.setTargetUniversity(trimToNull(request.targetUniversity()));
    lead.setCurrentMajor(trimToNull(request.currentMajor()));
    lead.setDesiredMajor(trimToNull(request.desiredMajor()));
    lead.setStudyYear(trimToNull(request.studyYear()));
    lead.setDegreeLevel(trimToNull(request.degreeLevel()));
    lead.setNotes(trimToNull(request.notes()));
    lead.setSource(trimToNull(request.source()));
  }

  private void applyUpdate(Lead lead, LeadUpdateRequest request, Employee employee) {
    if (request.leadType() != null) {
      lead.setLeadType(request.leadType());
    }
    if (StringUtils.hasText(request.studentName())) {
      lead.setStudentName(request.studentName().trim());
    }
    if (request.phone() != null) {
      lead.setPhone(trimToNull(request.phone()));
    }
    if (request.email() != null) {
      lead.setEmail(trimToNull(request.email()));
    }
    if (request.nationality() != null) {
      lead.setNationality(trimToNull(request.nationality()));
    }
    if (request.currentUniversity() != null) {
      lead.setCurrentUniversity(trimToNull(request.currentUniversity()));
    }
    if (request.targetUniversity() != null) {
      lead.setTargetUniversity(trimToNull(request.targetUniversity()));
    }
    if (request.currentMajor() != null) {
      lead.setCurrentMajor(trimToNull(request.currentMajor()));
    }
    if (request.desiredMajor() != null) {
      lead.setDesiredMajor(trimToNull(request.desiredMajor()));
    }
    if (request.studyYear() != null) {
      lead.setStudyYear(trimToNull(request.studyYear()));
    }
    if (request.degreeLevel() != null) {
      lead.setDegreeLevel(trimToNull(request.degreeLevel()));
    }
    if (request.notes() != null) {
      lead.setNotes(trimToNull(request.notes()));
    }
    if (request.status() != null && request.status() != lead.getStatus()) {
      changeStatus(lead, request.status(), employee);
    }
  }

  private void changeStatus(Lead lead, LeadStatus newStatus, Employee actor) {
    LeadStatus oldStatus = lead.getStatus();
    lead.setStatus(newStatus);

    LeadStatusHistory history = new LeadStatusHistory();
    history.setId(UUID.randomUUID());
    history.setLead(lead);
    history.setEmployee(actor);
    history.setOldStatus(oldStatus);
    history.setNewStatus(newStatus);
    history.setChangedAt(OffsetDateTime.now());
    statusHistoryRepository.save(history);
  }

  private void notifyEmployee(Lead lead, OffsetDateTime assignedAt) {
    Employee employee = lead.getAssignedEmployee();
    if (employee == null || employee.getTelegramChatId() == null) {
      log.warn(
          "Lead {} assigned but employee {} has no Telegram chat ID; notification skipped",
          lead.getId(),
          employee != null ? employee.getId() : null);
      return;
    }

    String message = notificationFormatter.formatNewLead(lead, assignedAt);
    try {
      telegramService.sendMessage(employee.getTelegramChatId(), message);
    } catch (TelegramDeliveryException ex) {
      log.error("Lead {} assigned but Telegram notification failed", lead.getId(), ex);
    }
  }

  private Lead requireLead(UUID id) {
    return leadRepository
        .findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Lead not found: " + id));
  }

  private Lead requireLeadForEmployee(UUID leadId, UUID employeeId) {
    Lead lead =
        leadRepository
            .findByIdWithEmployee(leadId)
            .orElseThrow(() -> new ResourceNotFoundException("Lead not found: " + leadId));
    if (lead.getAssignedEmployee() == null
        || !employeeId.equals(lead.getAssignedEmployee().getId())) {
      throw new AccessDeniedLeadException("This lead is not assigned to you");
    }
    return lead;
  }

  private static String trimToNull(String value) {
    if (!StringUtils.hasText(value)) {
      return null;
    }
    return value.trim();
  }
}
