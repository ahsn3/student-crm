package com.ingazgate.crm.lead.dto;

import java.time.OffsetDateTime;
import java.util.UUID;

public record EmployeeResponse(
    UUID id,
    String name,
    String email,
    Long telegramChatId,
    String telegramUsername,
    boolean active,
    OffsetDateTime lastAssignedAt,
    OffsetDateTime createdAt) {}
