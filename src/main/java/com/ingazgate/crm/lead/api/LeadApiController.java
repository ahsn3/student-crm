package com.ingazgate.crm.lead.api;

import com.ingazgate.crm.lead.dto.LeadAssignmentHistoryResponse;
import com.ingazgate.crm.lead.dto.LeadRequest;
import com.ingazgate.crm.lead.dto.LeadResponse;
import com.ingazgate.crm.lead.service.LeadService;
import jakarta.validation.Valid;
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

  public LeadApiController(LeadService leadService) {
    this.leadService = leadService;
  }

  @GetMapping
  List<LeadResponse> list() {
    return leadService.listLeads();
  }

  @GetMapping("/{id}")
  LeadResponse get(@PathVariable UUID id) {
    return leadService.getLead(id);
  }

  @GetMapping("/{id}/assignment-history")
  List<LeadAssignmentHistoryResponse> assignmentHistory(@PathVariable UUID id) {
    return leadService.getAssignmentHistory(id);
  }

  @PostMapping
  ResponseEntity<LeadResponse> create(@Valid @RequestBody LeadRequest request) {
    LeadResponse created = leadService.createLead(request);
    return ResponseEntity.status(HttpStatus.CREATED).body(created);
  }
}
