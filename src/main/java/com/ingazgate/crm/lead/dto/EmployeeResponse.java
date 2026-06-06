package com.ingazgate.crm.lead.dto;

import com.ingazgate.crm.lead.entity.EmployeeDepartment;
import java.time.OffsetDateTime;
import java.util.UUID;

public record EmployeeResponse(
    UUID id,
    String name,
    String email,
    Long telegramChatId,
    String telegramUsername,
    EmployeeDepartment department,
    boolean active,
    OffsetDateTime lastAssignedAt,
    OffsetDateTime createdAt) {}
