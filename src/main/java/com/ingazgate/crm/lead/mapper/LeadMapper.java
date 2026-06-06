package com.ingazgate.crm.lead.mapper;

import com.ingazgate.crm.lead.dto.LeadAssignmentHistoryResponse;
import com.ingazgate.crm.lead.dto.LeadResponse;
import com.ingazgate.crm.lead.entity.Lead;
import com.ingazgate.crm.lead.entity.LeadAssignmentHistory;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = EmployeeMapper.class)
public interface LeadMapper {
  @Mapping(target = "assignedEmployee", source = "assignedEmployee")
  LeadResponse toResponse(Lead lead);

  @Mapping(target = "leadId", source = "lead.id")
  LeadAssignmentHistoryResponse toHistoryResponse(LeadAssignmentHistory history);
}
