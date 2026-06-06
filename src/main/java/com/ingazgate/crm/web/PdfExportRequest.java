package com.ingazgate.crm.web;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.util.List;
import java.util.UUID;

public record PdfExportRequest(
    @Size(max = 120) String studentName,
    @NotNull @NotEmpty List<UUID> programIds) {}
