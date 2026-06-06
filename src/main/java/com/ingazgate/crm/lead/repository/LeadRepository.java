package com.ingazgate.crm.lead.repository;

import com.ingazgate.crm.lead.entity.Lead;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LeadRepository extends JpaRepository<Lead, UUID> {
  @Query("SELECT l FROM Lead l LEFT JOIN FETCH l.assignedEmployee ORDER BY l.createdAt DESC")
  List<Lead> findAllWithAssignedEmployee();
}
