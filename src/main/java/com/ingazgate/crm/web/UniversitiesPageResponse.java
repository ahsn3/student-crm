package com.ingazgate.crm.web;

import java.util.List;

public record UniversitiesPageResponse(
    List<UniversityListItem> items, long total, int page, int size) {}
