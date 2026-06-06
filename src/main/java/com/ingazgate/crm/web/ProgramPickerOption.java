package com.ingazgate.crm.web;

import java.util.UUID;

public record ProgramPickerOption(
    UUID id,
    UUID universityId,
    String universityName,
    String programName,
    String degree,
    String language) {}
