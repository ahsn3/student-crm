package com.ingazgate.crm.web;

import java.util.UUID;

/** Slim id + name for filter dropdowns (avoids loading full University rows). */
public record UniversityFilterOption(UUID id, String name) {}
