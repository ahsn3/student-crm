package com.ingazgate.crm.lead.service;

import com.ingazgate.crm.lead.dto.LeadReportResponse;
import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadType;
import com.ingazgate.crm.lead.repository.LeadRepository;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LeadReportService {
  private final LeadRepository leadRepository;

  public LeadReportService(LeadRepository leadRepository) {
    this.leadRepository = leadRepository;
  }

  @Transactional(readOnly = true)
  public LeadReportResponse buildReport() {
    long total = leadRepository.count();

    Map<LeadType, Long> byType = new LinkedHashMap<>();
    for (LeadType type : LeadType.values()) {
      byType.put(type, leadRepository.countByLeadType(type));
    }

    Map<LeadStatus, Long> byStatus = new LinkedHashMap<>();
    for (LeadStatus status : LeadStatus.values()) {
      byStatus.put(status, leadRepository.countByStatus(status));
    }

    List<LeadReportResponse.EmployeeLeadCount> byEmployee =
        leadRepository.countByEmployee().stream()
            .map(
                row ->
                    new LeadReportResponse.EmployeeLeadCount(
                        (UUID) row[0], (String) row[1], (Long) row[2]))
            .toList();

    long accepted = leadRepository.countByStatus(LeadStatus.ACCEPTED);
    double conversionRate = total == 0 ? 0.0 : (accepted * 100.0) / total;

    List<LeadReportResponse.MonthlyLeadCount> monthly =
        leadRepository.countByMonth().stream()
            .map(row -> new LeadReportResponse.MonthlyLeadCount((String) row[0], (Long) row[1]))
            .toList();

    return new LeadReportResponse(total, byType, byStatus, byEmployee, conversionRate, monthly);
  }
}
