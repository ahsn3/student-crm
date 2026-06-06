package com.ingazgate.crm.lead.dto;

import com.ingazgate.crm.lead.entity.LeadStatus;
import java.time.OffsetDateTime;
import java.util.UUID;

public record LeadResponse(
    UUID id,
    String name,
    String phone,
    String email,
    String company,
    String serviceRequested,
    String notes,
    LeadStatus status,
    String source,
    EmployeeResponse assignedEmployee,
    OffsetDateTime createdAt) {}
