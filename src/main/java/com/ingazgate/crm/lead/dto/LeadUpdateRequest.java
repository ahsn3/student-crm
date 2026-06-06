package com.ingazgate.crm.lead.dto;

import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadType;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;

public record LeadUpdateRequest(
    LeadType leadType,
    @Size(max = 120) String studentName,
    @Size(max = 40) String phone,
    @Email @Size(max = 255) String email,
    @Size(max = 120) String nationality,
    @Size(max = 255) String currentUniversity,
    @Size(max = 255) String targetUniversity,
    @Size(max = 255) String currentMajor,
    @Size(max = 255) String desiredMajor,
    @Size(max = 40) String studyYear,
    @Size(max = 80) String degreeLevel,
    @Size(max = 120) String source,
    @Size(max = 4000) String notes,
    LeadStatus status) {}
