package com.ingazgate.crm.lead.dto;

import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadType;
import java.util.List;

public record LeadPageResponse(
    List<LeadResponse> items,
    int page,
    int size,
    long totalElements,
    int totalPages,
    LeadStatus statusFilter,
    LeadType leadTypeFilter,
    String search) {}
