package com.ingazgate.crm.lead.web;

import com.ingazgate.crm.lead.dto.LeadDetailResponse;
import com.ingazgate.crm.lead.dto.LeadPageResponse;
import com.ingazgate.crm.lead.dto.LeadUpdateRequest;
import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadType;
import com.ingazgate.crm.lead.service.LeadNoteService;
import com.ingazgate.crm.lead.service.LeadService;
import com.ingazgate.crm.user.AppUser;
import com.ingazgate.crm.web.AuthUsers;
import java.security.Principal;
import java.util.UUID;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LeadWebController {
  private final LeadService leadService;
  private final LeadNoteService leadNoteService;
  private final AuthUsers authUsers;

  public LeadWebController(
      LeadService leadService, LeadNoteService leadNoteService, AuthUsers authUsers) {
    this.leadService = leadService;
    this.leadNoteService = leadNoteService;
    this.authUsers = authUsers;
  }

  @GetMapping("/my-leads")
  String myLeads(
      Model model,
      Principal principal,
      @RequestParam(defaultValue = "0") int page,
      @RequestParam(required = false) LeadStatus status,
      @RequestParam(required = false) LeadType leadType,
      @RequestParam(required = false) String search) {
    AppUser user = authUsers.requireCurrentUser(principal);
    LeadPageResponse leads = leadService.getMyLeads(user, page, 20, status, leadType, search);

    model.addAttribute("pageTitleKey", "page.myLeads.title");
    model.addAttribute("activeNav", "myLeads");
    model.addAttribute("contentTemplate", "pages/my-leads");
    model.addAttribute("leadsPage", leads);
    model.addAttribute("statusFilter", status);
    model.addAttribute("leadTypeFilter", leadType);
    model.addAttribute("searchQuery", search);
    model.addAttribute("leadStatuses", LeadStatus.values());
    model.addAttribute("leadTypes", LeadType.values());
    return "layout/shell";
  }

  @GetMapping("/my-leads/{id}")
  String myLeadDetail(@PathVariable UUID id, Model model, Principal principal) {
    AppUser user = authUsers.requireCurrentUser(principal);
    LeadDetailResponse detail = leadService.getMyLeadDetail(user, id);

    model.addAttribute("pageTitle", detail.lead().studentName());
    model.addAttribute("activeNav", "myLeads");
    model.addAttribute("contentTemplate", "pages/lead-detail");
    model.addAttribute("detail", detail);
    model.addAttribute("leadStatuses", LeadStatus.values());
    model.addAttribute("leadTypes", LeadType.values());
    return "layout/shell";
  }

  @PostMapping("/my-leads/{id}/update")
  String updateLead(
      @PathVariable UUID id,
      Principal principal,
      @RequestParam(required = false) LeadStatus status,
      @RequestParam(required = false) String studentName,
      @RequestParam(required = false) String phone,
      @RequestParam(required = false) String email,
      @RequestParam(required = false) String nationality,
      @RequestParam(required = false) String targetUniversity,
      @RequestParam(required = false) String desiredMajor,
      @RequestParam(required = false) String notes) {
    AppUser user = authUsers.requireCurrentUser(principal);
    LeadUpdateRequest request =
        new LeadUpdateRequest(
            null,
            studentName,
            phone,
            email,
            nationality,
            null,
            targetUniversity,
            null,
            desiredMajor,
            null,
            null,
            notes,
            status);
    leadService.updateMyLead(user, id, request);
    return "redirect:/my-leads/" + id + "?saved=1";
  }

  @PostMapping("/my-leads/{id}/notes")
  String addNote(
      @PathVariable UUID id,
      Principal principal,
      @RequestParam String note) {
    AppUser user = authUsers.requireCurrentUser(principal);
    leadNoteService.addNote(user, id, new com.ingazgate.crm.lead.dto.LeadNoteRequest(note));
    return "redirect:/my-leads/" + id + "?noteSaved=1";
  }
}
