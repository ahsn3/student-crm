package com.ingazgate.crm.lead.repository;

import com.ingazgate.crm.lead.entity.LeadAssignmentHistory;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LeadAssignmentHistoryRepository extends JpaRepository<LeadAssignmentHistory, UUID> {
  @Query(
      """
      SELECT h FROM LeadAssignmentHistory h
      JOIN FETCH h.employee
      WHERE h.lead.id = :leadId
      ORDER BY h.assignedAt DESC
      """)
  List<LeadAssignmentHistory> findByLeadIdOrderByAssignedAtDesc(@Param("leadId") UUID leadId);
}
