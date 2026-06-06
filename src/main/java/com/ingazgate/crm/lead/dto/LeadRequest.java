package com.ingazgate.crm.lead.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record LeadRequest(
    @NotBlank @Size(max = 120) String name,
    @Size(max = 40) String phone,
    @Email @Size(max = 255) String email,
    @Size(max = 255) String company,
    @Size(max = 255) String serviceRequested,
    @Size(max = 4000) String notes,
    @Size(max = 120) String source) {}
