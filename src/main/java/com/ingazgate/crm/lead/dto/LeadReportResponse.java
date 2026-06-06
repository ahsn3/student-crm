package com.ingazgate.crm.lead.dto;

import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadType;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public record LeadReportResponse(
    long totalLeads,
    Map<LeadType, Long> leadsByType,
    Map<LeadStatus, Long> leadsByStatus,
    List<EmployeeLeadCount> leadsByEmployee,
    double conversionRate,
    List<MonthlyLeadCount> monthlyLeadCounts) {

  public record EmployeeLeadCount(UUID id, String name, long count) {}

  public record MonthlyLeadCount(String month, long count) {}
}
