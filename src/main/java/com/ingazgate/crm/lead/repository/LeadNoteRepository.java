package com.ingazgate.crm.lead.repository;

import com.ingazgate.crm.lead.entity.LeadNote;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LeadNoteRepository extends JpaRepository<LeadNote, UUID> {
  @Query(
      """
      SELECT n FROM LeadNote n
      JOIN FETCH n.employee
      WHERE n.lead.id = :leadId
      ORDER BY n.createdAt DESC
      """)
  List<LeadNote> findByLeadIdOrderByCreatedAtDesc(@Param("leadId") UUID leadId);
}
