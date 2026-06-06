package com.ingazgate.crm.lead.api;

import com.ingazgate.crm.lead.dto.LeadReportResponse;
import com.ingazgate.crm.lead.service.LeadReportService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/reports")
public class LeadReportApiController {
  private final LeadReportService leadReportService;

  public LeadReportApiController(LeadReportService leadReportService) {
    this.leadReportService = leadReportService;
  }

  @GetMapping("/leads")
  LeadReportResponse leads() {
    return leadReportService.buildReport();
  }
}
