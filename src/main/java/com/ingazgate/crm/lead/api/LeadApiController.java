package com.ingazgate.crm.lead.api;

import com.ingazgate.crm.lead.dto.LeadAssignmentHistoryResponse;
import com.ingazgate.crm.lead.dto.LeadDetailResponse;
import com.ingazgate.crm.lead.dto.LeadNoteRequest;
import com.ingazgate.crm.lead.dto.LeadNoteResponse;
import com.ingazgate.crm.lead.dto.LeadRequest;
import com.ingazgate.crm.lead.dto.LeadResponse;
import com.ingazgate.crm.lead.dto.LeadStatusHistoryResponse;
import com.ingazgate.crm.lead.service.LeadNoteService;
import com.ingazgate.crm.lead.service.LeadService;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.web.AuthUsers;
import jakarta.validation.Valid;
import java.security.Principal;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/leads")
public class LeadApiController {
  private final LeadService leadService;
  private final LeadNoteService leadNoteService;
  private final AuthUsers authUsers;

  public LeadApiController(
      LeadService leadService, LeadNoteService leadNoteService, AuthUsers authUsers) {
    this.leadService = leadService;
    this.leadNoteService = leadNoteService;
    this.authUsers = authUsers;
  }

  @GetMapping
  List<LeadResponse> list() {
    return leadService.listLeads();
  }

  @GetMapping("/{id}")
  LeadDetailResponse get(@PathVariable UUID id) {
    return leadService.getLeadDetail(id);
  }

  @GetMapping("/{id}/assignment-history")
  List<LeadAssignmentHistoryResponse> assignmentHistory(@PathVariable UUID id) {
    return leadService.getAssignmentHistory(id);
  }

  @GetMapping("/{id}/status-history")
  List<LeadStatusHistoryResponse> statusHistory(@PathVariable UUID id) {
    return leadService.getStatusHistory(id);
  }

  @GetMapping("/{id}/notes")
  List<LeadNoteResponse> notes(@PathVariable UUID id) {
    return leadNoteService.listNotes(id);
  }

  @PostMapping("/{id}/notes")
  ResponseEntity<LeadNoteResponse> addNote(
      @PathVariable UUID id, @Valid @RequestBody LeadNoteRequest request, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    LeadNoteResponse created = leadNoteService.addNote(user, id, request);
    return ResponseEntity.status(HttpStatus.CREATED).body(created);
  }

  @PostMapping
  ResponseEntity<LeadResponse> create(@Valid @RequestBody LeadRequest request) {
    LeadResponse created = leadService.createLead(request);
    return ResponseEntity.status(HttpStatus.CREATED).body(created);
  }
}
