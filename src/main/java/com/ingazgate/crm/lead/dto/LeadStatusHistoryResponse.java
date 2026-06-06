package com.ingazgate.crm.lead.dto;

import com.ingazgate.crm.lead.entity.LeadStatus;
import java.time.OffsetDateTime;
import java.util.UUID;

public record LeadStatusHistoryResponse(
    UUID id,
    UUID leadId,
    EmployeeResponse employee,
    LeadStatus oldStatus,
    LeadStatus newStatus,
    OffsetDateTime changedAt) {}
