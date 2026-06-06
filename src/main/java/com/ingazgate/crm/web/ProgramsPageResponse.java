package com.ingazgate.crm.web;

import java.util.List;

public record ProgramsPageResponse(
    List<ProgramListItem> items, long total, int page, int size) {}
