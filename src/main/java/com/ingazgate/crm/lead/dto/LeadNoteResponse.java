package com.ingazgate.crm.lead.dto;

import java.time.OffsetDateTime;
import java.util.UUID;

public record LeadNoteResponse(
    UUID id,
    UUID leadId,
    EmployeeResponse employee,
    String note,
    OffsetDateTime createdAt) {}
