package com.ingazgate.crm.lead.mapper;

import com.ingazgate.crm.lead.dto.LeadAssignmentHistoryResponse;
import com.ingazgate.crm.lead.dto.LeadNoteResponse;
import com.ingazgate.crm.lead.dto.LeadResponse;
import com.ingazgate.crm.lead.dto.LeadStatusHistoryResponse;
import com.ingazgate.crm.lead.entity.Lead;
import com.ingazgate.crm.lead.entity.LeadAssignmentHistory;
import com.ingazgate.crm.lead.entity.LeadNote;
import com.ingazgate.crm.lead.entity.LeadStatusHistory;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = EmployeeMapper.class)
public interface LeadMapper {
  LeadResponse toResponse(Lead lead);

  @Mapping(target = "leadId", source = "lead.id")
  LeadAssignmentHistoryResponse toHistoryResponse(LeadAssignmentHistory history);

  @Mapping(target = "leadId", source = "lead.id")
  LeadNoteResponse toNoteResponse(LeadNote note);

  @Mapping(target = "leadId", source = "lead.id")
  LeadStatusHistoryResponse toStatusHistoryResponse(LeadStatusHistory history);
}
