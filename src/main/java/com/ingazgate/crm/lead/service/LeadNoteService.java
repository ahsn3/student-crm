package com.ingazgate.crm.lead.service;

import com.ingazgate.crm.lead.dto.LeadNoteRequest;
import com.ingazgate.crm.lead.dto.LeadNoteResponse;
import com.ingazgate.crm.lead.entity.Employee;
import com.ingazgate.crm.lead.entity.Lead;
import com.ingazgate.crm.lead.entity.LeadNote;
import com.ingazgate.crm.lead.exception.AccessDeniedLeadException;
import com.ingazgate.crm.lead.exception.ResourceNotFoundException;
import com.ingazgate.crm.lead.mapper.LeadMapper;
import com.ingazgate.crm.lead.repository.LeadNoteRepository;
import com.ingazgate.crm.lead.repository.LeadRepository;
import com.ingazgate.crm.user.AppUser;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LeadNoteService {
  private final LeadNoteRepository leadNoteRepository;
  private final LeadRepository leadRepository;
  private final LeadMapper leadMapper;
  private final EmployeeAccessService employeeAccessService;

  public LeadNoteService(
      LeadNoteRepository leadNoteRepository,
      LeadRepository leadRepository,
      LeadMapper leadMapper,
      EmployeeAccessService employeeAccessService) {
    this.leadNoteRepository = leadNoteRepository;
    this.leadRepository = leadRepository;
    this.leadMapper = leadMapper;
    this.employeeAccessService = employeeAccessService;
  }

  @Transactional(readOnly = true)
  public List<LeadNoteResponse> listNotes(UUID leadId) {
    requireLead(leadId);
    return leadNoteRepository.findByLeadIdOrderByCreatedAtDesc(leadId).stream()
        .map(leadMapper::toNoteResponse)
        .toList();
  }

  @Transactional
  public LeadNoteResponse addNote(AppUser user, UUID leadId, LeadNoteRequest request) {
    Employee employee = employeeAccessService.requireLinkedEmployee(user);
    Lead lead = requireLead(leadId);
    assertCanAccessLead(lead, employee, user);

    LeadNote note = new LeadNote();
    note.setId(UUID.randomUUID());
    note.setLead(lead);
    note.setEmployee(employee);
    note.setNote(request.note().trim());
    note.setCreatedAt(OffsetDateTime.now());
    return leadMapper.toNoteResponse(leadNoteRepository.save(note));
  }

  private Lead requireLead(UUID leadId) {
    return leadRepository
        .findByIdWithEmployee(leadId)
        .orElseThrow(() -> new ResourceNotFoundException("Lead not found: " + leadId));
  }

  private void assertCanAccessLead(Lead lead, Employee employee, AppUser user) {
    if (employeeAccessService.isAdmin(user)) {
      return;
    }
    if (lead.getAssignedEmployee() == null
        || !employee.getId().equals(lead.getAssignedEmployee().getId())) {
      throw new AccessDeniedLeadException("This lead is not assigned to you");
    }
  }
}
