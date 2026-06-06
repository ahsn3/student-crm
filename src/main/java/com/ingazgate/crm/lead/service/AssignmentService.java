package com.ingazgate.crm.lead.service;

import com.ingazgate.crm.lead.entity.Employee;
import com.ingazgate.crm.lead.entity.Lead;
import com.ingazgate.crm.lead.entity.LeadAssignmentHistory;
import com.ingazgate.crm.lead.exception.NoActiveEmployeeException;
import com.ingazgate.crm.lead.repository.EmployeeRepository;
import com.ingazgate.crm.lead.repository.LeadAssignmentHistoryRepository;
import java.time.OffsetDateTime;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AssignmentService {
  private static final Logger log = LoggerFactory.getLogger(AssignmentService.class);

  private final EmployeeRepository employeeRepository;
  private final LeadAssignmentHistoryRepository historyRepository;

  public AssignmentService(
      EmployeeRepository employeeRepository, LeadAssignmentHistoryRepository historyRepository) {
    this.employeeRepository = employeeRepository;
    this.historyRepository = historyRepository;
  }

  @Transactional
  public Employee assignLead(Lead lead) {
    Employee employee =
        employeeRepository.findActiveForRoundRobin(PageRequest.of(0, 1)).stream()
            .findFirst()
            .orElseThrow(NoActiveEmployeeException::new);

    OffsetDateTime assignedAt = OffsetDateTime.now();
    employee.setLastAssignedAt(assignedAt);
    employeeRepository.save(employee);

    LeadAssignmentHistory history = new LeadAssignmentHistory();
    history.setId(UUID.randomUUID());
    history.setLead(lead);
    history.setEmployee(employee);
    history.setAssignedAt(assignedAt);
    historyRepository.save(history);

    log.info(
        "Assigned lead {} to employee {} ({})",
        lead.getId(),
        employee.getId(),
        employee.getName());

    return employee;
  }
}
