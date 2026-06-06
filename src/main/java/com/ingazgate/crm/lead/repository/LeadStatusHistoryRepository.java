package com.ingazgate.crm.lead.repository;

import com.ingazgate.crm.lead.entity.LeadStatusHistory;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LeadStatusHistoryRepository extends JpaRepository<LeadStatusHistory, UUID> {
  @Query(
      """
      SELECT h FROM LeadStatusHistory h
      LEFT JOIN FETCH h.employee
      WHERE h.lead.id = :leadId
      ORDER BY h.changedAt DESC
      """)
  List<LeadStatusHistory> findByLeadIdOrderByChangedAtDesc(@Param("leadId") UUID leadId);
}
