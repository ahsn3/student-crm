package com.ingazgate.crm.student;

import java.time.OffsetDateTime;
import java.util.UUID;

/** Server-rendered row for application detail chat (like news/complaint comments). */
public record ApplicationChatLine(
    UUID id,
    String senderName,
    boolean mine,
    boolean senderAdmin,
    String body,
    String fileName,
    boolean hasFile,
    OffsetDateTime createdAt) {}
