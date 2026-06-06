package com.ingazgate.crm.lead.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record LeadNoteRequest(@NotBlank @Size(max = 4000) String note) {}
