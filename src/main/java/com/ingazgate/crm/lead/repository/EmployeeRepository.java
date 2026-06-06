package com.ingazgate.crm.lead.repository;

import com.ingazgate.crm.lead.entity.Employee;
import com.ingazgate.crm.lead.entity.EmployeeDepartment;
import jakarta.persistence.LockModeType;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface EmployeeRepository extends JpaRepository<Employee, UUID> {
  boolean existsByEmailIgnoreCase(String email);

  boolean existsByEmailIgnoreCaseAndIdNot(String email, UUID id);

  Optional<Employee> findByEmailIgnoreCase(String email);

  List<Employee> findAllByOrderByNameAsc();

  @Lock(LockModeType.PESSIMISTIC_WRITE)
  @Query(
      """
      SELECT e FROM Employee e
      WHERE e.active = true AND e.department = :department
      ORDER BY e.lastAssignedAt ASC NULLS FIRST
      """)
  List<Employee> findActiveForRoundRobinByDepartment(
      @Param("department") EmployeeDepartment department, Pageable pageable);
}
