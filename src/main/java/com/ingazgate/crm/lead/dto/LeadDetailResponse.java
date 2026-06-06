package com.ingazgate.crm.lead.dto;

import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadType;
import java.util.List;

public record LeadDetailResponse(
    LeadResponse lead,
    List<LeadAssignmentHistoryResponse> assignmentHistory,
    List<LeadNoteResponse> notes,
    List<LeadStatusHistoryResponse> statusHistory) {}
