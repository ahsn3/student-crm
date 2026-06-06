package com.ingazgate.crm.lead.repository;

import com.ingazgate.crm.lead.entity.Employee;
import jakarta.persistence.LockModeType;
import java.util.List;
import java.util.UUID;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;

public interface EmployeeRepository extends JpaRepository<Employee, UUID> {
  boolean existsByEmailIgnoreCase(String email);

  boolean existsByEmailIgnoreCaseAndIdNot(String email, UUID id);

  List<Employee> findAllByOrderByNameAsc();

  @Lock(LockModeType.PESSIMISTIC_WRITE)
  @Query(
      """
      SELECT e FROM Employee e
      WHERE e.active = true
      ORDER BY e.lastAssignedAt ASC NULLS FIRST
      """)
  List<Employee> findActiveForRoundRobin(Pageable pageable);
}
