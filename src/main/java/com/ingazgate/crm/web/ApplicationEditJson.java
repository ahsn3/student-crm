package com.ingazgate.crm.web;

import java.util.UUID;

/** JSON payload for the applications list in-page edit modal. */
public record ApplicationEditJson(
    UUID id,
    String applicationNumber,
    String studentName,
    UUID programId,
    String status,
    String applicationType,
    String semester,
    String notes) {}
