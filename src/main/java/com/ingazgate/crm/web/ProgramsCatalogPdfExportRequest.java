package com.ingazgate.crm.web;

import jakarta.validation.constraints.Size;
import java.util.List;

public record ProgramsCatalogPdfExportRequest(
    @Size(max = 120) String studentName,
    @Size(max = 200) String search,
    List<@Size(max = 200) String> university,
    @Size(max = 120) String degree,
    @Size(max = 120) String language,
    @Size(max = 120) String country) {}
