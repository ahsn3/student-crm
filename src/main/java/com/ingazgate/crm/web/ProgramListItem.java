package com.ingazgate.crm.web;

import java.math.BigDecimal;
import java.util.UUID;

/** Lightweight program row for the Programs page JSON API. */
public record ProgramListItem(
    UUID id,
    String name,
    String nameAr,
    boolean available,
    String degree,
    String language,
    Integer years,
    BigDecimal beforeDiscount,
    BigDecimal cost,
    BigDecimal cashPrice,
    UUID universityId,
    String universityName,
    String universityCountry,
    String universityLogoUrl,
    String currency,
    String updatedAt) {}
