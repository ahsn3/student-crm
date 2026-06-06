package com.ingazgate.crm.lead.service;

import com.ingazgate.crm.lead.dto.LeadAssignmentHistoryResponse;
import com.ingazgate.crm.lead.dto.LeadRequest;
import com.ingazgate.crm.lead.dto.LeadResponse;
import com.ingazgate.crm.lead.entity.Employee;
import com.ingazgate.crm.lead.entity.Lead;
import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.exception.ResourceNotFoundException;
import com.ingazgate.crm.lead.mapper.LeadMapper;
import com.ingazgate.crm.lead.repository.LeadAssignmentHistoryRepository;
import com.ingazgate.crm.lead.repository.LeadRepository;
import com.ingazgate.crm.lead.telegram.TelegramService;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Service
public class LeadService {
  private static final Logger log = LoggerFactory.getLogger(LeadService.class);

  private final LeadRepository leadRepository;
  private final LeadAssignmentHistoryRepository historyRepository;
  private final AssignmentService assignmentService;
  private final TelegramService telegramService;
  private final TelegramNotificationFormatter notificationFormatter;
  private final LeadMapper leadMapper;

  public LeadService(
      LeadRepository leadRepository,
      LeadAssignmentHistoryRepository historyRepository,
      AssignmentService assignmentService,
      TelegramService telegramService,
      TelegramNotificationFormatter notificationFormatter,
      LeadMapper leadMapper) {
    this.leadRepository = leadRepository;
    this.historyRepository = historyRepository;
    this.assignmentService = assignmentService;
    this.telegramService = telegramService;
    this.notificationFormatter = notificationFormatter;
    this.leadMapper = leadMapper;
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
  public List<LeadAssignmentHistoryResponse> getAssignmentHistory(UUID leadId) {
    requireLead(leadId);
    return historyRepository.findByLeadIdOrderByAssignedAtDesc(leadId).stream()
        .map(leadMapper::toHistoryResponse)
        .toList();
  }

  @Transactional
  public LeadResponse createLead(LeadRequest request) {
    Lead lead = new Lead();
    lead.setId(UUID.randomUUID());
    lead.setName(request.name().trim());
    lead.setPhone(trimToNull(request.phone()));
    lead.setEmail(trimToNull(request.email()));
    lead.setCompany(trimToNull(request.company()));
    lead.setServiceRequested(trimToNull(request.serviceRequested()));
    lead.setNotes(trimToNull(request.notes()));
    lead.setSource(trimToNull(request.source()));
    lead.setStatus(LeadStatus.NEW);
    lead.setCreatedAt(OffsetDateTime.now());
    lead = leadRepository.save(lead);

    Employee employee = assignmentService.assignLead(lead);
    lead.setAssignedEmployee(employee);
    lead.setStatus(LeadStatus.ASSIGNED);
    lead = leadRepository.save(lead);

    notifyEmployee(lead, employee.getLastAssignedAt());
    return leadMapper.toResponse(lead);
  }

  @Transactional
  public LeadResponse createSampleLead() {
    return createLead(
        new LeadRequest(
            "Ahmed Hassan",
            "+20123456789",
            "ahmed@example.com",
            "ABC Company",
            "CRM Development",
            "Interested in automation and lead management.",
            "test-api"));
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
    telegramService.sendMessage(employee.getTelegramChatId(), message);
  }

  private Lead requireLead(UUID id) {
    return leadRepository
        .findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Lead not found: " + id));
  }

  private static String trimToNull(String value) {
    if (!StringUtils.hasText(value)) {
      return null;
    }
    return value.trim();
  }
}
