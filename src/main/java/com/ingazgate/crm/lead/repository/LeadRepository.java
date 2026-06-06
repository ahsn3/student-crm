package com.ingazgate.crm.lead.repository;

import com.ingazgate.crm.lead.entity.Lead;
import com.ingazgate.crm.lead.entity.LeadStatus;
import com.ingazgate.crm.lead.entity.LeadType;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface LeadRepository extends JpaRepository<Lead, UUID> {
  @Query("SELECT l FROM Lead l LEFT JOIN FETCH l.assignedEmployee ORDER BY l.createdAt DESC")
  List<Lead> findAllWithAssignedEmployee();

  @Query(
      """
      SELECT l FROM Lead l
      LEFT JOIN FETCH l.assignedEmployee
      LEFT JOIN FETCH l.student
      LEFT JOIN FETCH l.application
      WHERE l.id = :id
      """)
  Optional<Lead> findByIdWithEmployee(@Param("id") UUID id);

  List<Lead> findByStudentIsNull();

  @Query(
      value =
          """
          SELECT l FROM Lead l LEFT JOIN FETCH l.assignedEmployee
          WHERE l.assignedEmployee.id = :employeeId
          AND (:status IS NULL OR l.status = :status)
          AND (:leadType IS NULL OR l.leadType = :leadType)
          AND (
            :search IS NULL OR :search = '' OR
            LOWER(l.studentName) LIKE LOWER(CONCAT('%', :search, '%')) OR
            LOWER(COALESCE(l.phone, '')) LIKE LOWER(CONCAT('%', :search, '%')) OR
            LOWER(COALESCE(l.email, '')) LIKE LOWER(CONCAT('%', :search, '%'))
          )
          ORDER BY l.createdAt DESC
          """,
      countQuery =
          """
          SELECT COUNT(l) FROM Lead l
          WHERE l.assignedEmployee.id = :employeeId
          AND (:status IS NULL OR l.status = :status)
          AND (:leadType IS NULL OR l.leadType = :leadType)
          AND (
            :search IS NULL OR :search = '' OR
            LOWER(l.studentName) LIKE LOWER(CONCAT('%', :search, '%')) OR
            LOWER(COALESCE(l.phone, '')) LIKE LOWER(CONCAT('%', :search, '%')) OR
            LOWER(COALESCE(l.email, '')) LIKE LOWER(CONCAT('%', :search, '%'))
          )
          """)
  Page<Lead> findMyLeads(
      @Param("employeeId") UUID employeeId,
      @Param("status") LeadStatus status,
      @Param("leadType") LeadType leadType,
      @Param("search") String search,
      Pageable pageable);

  @Query(
      value =
          """
          SELECT l FROM Lead l LEFT JOIN FETCH l.assignedEmployee
          WHERE (:status IS NULL OR l.status = :status)
          AND (:leadType IS NULL OR l.leadType = :leadType)
          AND (
            :search IS NULL OR :search = '' OR
            LOWER(l.studentName) LIKE LOWER(CONCAT('%', :search, '%')) OR
            LOWER(COALESCE(l.phone, '')) LIKE LOWER(CONCAT('%', :search, '%')) OR
            LOWER(COALESCE(l.email, '')) LIKE LOWER(CONCAT('%', :search, '%'))
          )
          ORDER BY l.createdAt DESC
          """,
      countQuery =
          """
          SELECT COUNT(l) FROM Lead l
          WHERE (:status IS NULL OR l.status = :status)
          AND (:leadType IS NULL OR l.leadType = :leadType)
          AND (
            :search IS NULL OR :search = '' OR
            LOWER(l.studentName) LIKE LOWER(CONCAT('%', :search, '%')) OR
            LOWER(COALESCE(l.phone, '')) LIKE LOWER(CONCAT('%', :search, '%')) OR
            LOWER(COALESCE(l.email, '')) LIKE LOWER(CONCAT('%', :search, '%'))
          )
          """)
  Page<Lead> findAllLeads(
      @Param("status") LeadStatus status,
      @Param("leadType") LeadType leadType,
      @Param("search") String search,
      Pageable pageable);

  long countByStatus(LeadStatus status);

  long countByLeadType(LeadType leadType);

  @Query("SELECT COUNT(l) FROM Lead l WHERE l.createdAt >= :since")
  long countSince(@Param("since") java.time.OffsetDateTime since);

  @Query(
      """
      SELECT l.assignedEmployee.id, l.assignedEmployee.name, COUNT(l)
      FROM Lead l
      WHERE l.assignedEmployee IS NOT NULL
      GROUP BY l.assignedEmployee.id, l.assignedEmployee.name
      ORDER BY COUNT(l) DESC
      """)
  List<Object[]> countByEmployee();

  @Query(
      value =
          """
          SELECT TO_CHAR(created_at, 'YYYY-MM') AS month, COUNT(*)
          FROM crm_lead
          GROUP BY 1
          ORDER BY 1 DESC
          """,
      nativeQuery = true)
  List<Object[]> countByMonth();
}
