package com.ingazgate.crm.lead.web;

import com.ingazgate.crm.lead.dto.LeadDetailResponse;
import com.ingazgate.crm.lead.dto.LeadPageResponse;
import com.ingazgate.crm.lead.dto.LeadUpdateRequest;
import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadType;
import com.ingazgate.crm.lead.service.LeadNoteService;
import com.ingazgate.crm.lead.service.LeadService;
import com.ingazgate.crm.lead.service.EmployeeAccessService;
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
  private final EmployeeAccessService employeeAccessService;

  public LeadWebController(
      LeadService leadService,
      LeadNoteService leadNoteService,
      AuthUsers authUsers,
      EmployeeAccessService employeeAccessService) {
    this.leadService = leadService;
    this.leadNoteService = leadNoteService;
    this.authUsers = authUsers;
    this.employeeAccessService = employeeAccessService;
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
    boolean viewAllLeads = employeeAccessService.isAdmin(user);
    LeadPageResponse leads = leadService.getMyLeads(user, page, 20, status, leadType, search);

    model.addAttribute("pageTitleKey", viewAllLeads ? "page.leads.title" : "page.myLeads.title");
    model.addAttribute("activeNav", "myLeads");
    model.addAttribute("contentTemplate", "pages/my-leads");
    model.addAttribute("leadsPage", leads);
    model.addAttribute("viewAllLeads", viewAllLeads);
    model.addAttribute("statusFilter", status);
    model.addAttribute("leadTypeFilter", leadType);
    model.addAttribute("searchQuery", search);
    model.addAttribute("leadStatuses", LeadStatus.values());
    model.addAttribute("leadTypes", LeadType.values());
    return "layout/shell";
  }

  @GetMapping("/my-leads/{id}")
  String myLeadDetail(
      @PathVariable UUID id,
      Model model,
      Principal principal,
      @RequestParam(required = false) String saved,
      @RequestParam(required = false) String noteSaved) {
    AppUser user = authUsers.requireCurrentUser(principal);
    LeadDetailResponse detail = leadService.getMyLeadDetail(user, id);

    model.addAttribute("pageTitle", detail.lead().studentName());
    model.addAttribute("activeNav", "myLeads");
    model.addAttribute("bodyPageClass", "page-lead-detail");
    model.addAttribute("contentTemplate", "pages/lead-detail");
    model.addAttribute("detail", detail);
    model.addAttribute("saved", saved != null);
    model.addAttribute("noteAdded", noteSaved != null);
    model.addAttribute("viewAllLeads", employeeAccessService.isAdmin(user));
    model.addAttribute("leadStatuses", LeadStatus.values());
    model.addAttribute("leadTypes", LeadType.values());
    return "layout/shell";
  }

  @PostMapping("/my-leads/{id}/update")
  String updateLead(
      @PathVariable UUID id,
      Principal principal,
      @RequestParam(required = false) LeadType leadType,
      @RequestParam(required = false) String studentName,
      @RequestParam(required = false) String phone,
      @RequestParam(required = false) String email,
      @RequestParam(required = false) String nationality,
      @RequestParam(required = false) String currentUniversity,
      @RequestParam(required = false) String targetUniversity,
      @RequestParam(required = false) String currentMajor,
      @RequestParam(required = false) String desiredMajor,
      @RequestParam(required = false) String studyYear,
      @RequestParam(required = false) String degreeLevel,
      @RequestParam(required = false) String source,
      @RequestParam(required = false) String notes,
      @RequestParam(required = false) LeadStatus status) {
    AppUser user = authUsers.requireCurrentUser(principal);
    LeadUpdateRequest request =
        new LeadUpdateRequest(
            leadType,
            studentName,
            phone,
            email,
            nationality,
            currentUniversity,
            targetUniversity,
            currentMajor,
            desiredMajor,
            studyYear,
            degreeLevel,
            source,
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
