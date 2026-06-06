package com.ingazgate.crm.lead.api;

import com.ingazgate.crm.lead.dto.LeadDetailResponse;
import com.ingazgate.crm.lead.dto.LeadPageResponse;
import com.ingazgate.crm.lead.dto.LeadUpdateRequest;
import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadType;
import com.ingazgate.crm.lead.service.LeadService;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.web.AuthUsers;
import jakarta.validation.Valid;
import java.security.Principal;
import java.util.UUID;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/my-leads")
public class MyLeadApiController {
  private final LeadService leadService;
  private final AuthUsers authUsers;

  public MyLeadApiController(LeadService leadService, AuthUsers authUsers) {
    this.leadService = leadService;
    this.authUsers = authUsers;
  }

  @GetMapping
  LeadPageResponse list(
      Principal principal,
      @RequestParam(defaultValue = "0") int page,
      @RequestParam(defaultValue = "20") int size,
      @RequestParam(required = false) LeadStatus status,
      @RequestParam(required = false) LeadType leadType,
      @RequestParam(required = false) String search) {
    AppUser user = authUsers.requireCurrentUser(principal);
    return leadService.getMyLeads(user, page, size, status, leadType, search);
  }

  @GetMapping("/{id}")
  LeadDetailResponse get(@PathVariable UUID id, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    return leadService.getMyLeadDetail(user, id);
  }

  @PutMapping("/{id}")
  LeadDetailResponse update(
      @PathVariable UUID id,
      @Valid @RequestBody LeadUpdateRequest request,
      Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    leadService.updateMyLead(user, id, request);
    return leadService.getMyLeadDetail(user, id);
  }
}
