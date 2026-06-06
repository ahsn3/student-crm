package com.ingazgate.crm.lead.dto;

import java.time.OffsetDateTime;

public record ApiErrorResponse(
    int status, String error, String message, OffsetDateTime timestamp) {}
