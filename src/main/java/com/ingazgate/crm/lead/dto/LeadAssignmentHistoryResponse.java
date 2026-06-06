package com.ingazgate.crm.lead.dto;

import java.time.OffsetDateTime;
import java.util.UUID;

public record LeadAssignmentHistoryResponse(
    UUID id,
    UUID leadId,
    EmployeeResponse employee,
    OffsetDateTime assignedAt) {}
