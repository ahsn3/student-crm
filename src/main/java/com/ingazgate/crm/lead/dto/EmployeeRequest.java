package com.ingazgate.crm.lead.dto;

import com.ingazgate.crm.lead.entity.EmployeeDepartment;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record EmployeeRequest(
    @NotBlank @Size(max = 120) String name,
    @NotBlank @Email @Size(max = 255) String email,
    Long telegramChatId,
    @Size(max = 64) String telegramUsername,
    @NotNull EmployeeDepartment department,
    Boolean active) {}
