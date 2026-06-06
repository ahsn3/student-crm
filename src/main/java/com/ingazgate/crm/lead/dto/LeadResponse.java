package com.ingazgate.crm.lead.dto;

import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadType;
import java.time.OffsetDateTime;
import java.util.UUID;

public record LeadResponse(
    UUID id,
    LeadType leadType,
    String studentName,
    String phone,
    String email,
    String nationality,
    String currentUniversity,
    String targetUniversity,
    String currentMajor,
    String desiredMajor,
    String studyYear,
    String degreeLevel,
    String notes,
    LeadStatus status,
    String source,
    EmployeeResponse assignedEmployee,
    OffsetDateTime createdAt) {}
