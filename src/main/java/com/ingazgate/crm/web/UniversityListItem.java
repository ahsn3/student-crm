package com.ingazgate.crm.web;

import java.util.UUID;

/** Lightweight university row for the Universities page JSON API. */
public record UniversityListItem(
    UUID id,
    String name,
    String country,
    String currency,
    Integer programsCount,
    Integer campusesCount,
    String website,
    String logoUrl) {}
