package com.ingazgate.crm.lead.service;

import com.ingazgate.crm.lead.dto.EmployeeRequest;
import com.ingazgate.crm.lead.dto.EmployeeResponse;
import com.ingazgate.crm.lead.entity.Employee;
import com.ingazgate.crm.lead.exception.LeadApiException;
import com.ingazgate.crm.lead.exception.ResourceNotFoundException;
import com.ingazgate.crm.lead.mapper.EmployeeMapper;
import com.ingazgate.crm.lead.repository.EmployeeRepository;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Service
public class EmployeeService {
  private final EmployeeRepository employeeRepository;
  private final EmployeeMapper employeeMapper;

  public EmployeeService(EmployeeRepository employeeRepository, EmployeeMapper employeeMapper) {
    this.employeeRepository = employeeRepository;
    this.employeeMapper = employeeMapper;
  }

  @Transactional(readOnly = true)
  public List<EmployeeResponse> listEmployees() {
    return employeeRepository.findAllByOrderByNameAsc().stream()
        .map(employeeMapper::toResponse)
        .toList();
  }

  @Transactional(readOnly = true)
  public EmployeeResponse getEmployee(UUID id) {
    return employeeMapper.toResponse(requireEmployee(id));
  }

  @Transactional
  public EmployeeResponse createEmployee(EmployeeRequest request) {
    String email = normalizeEmail(request.email());
    if (employeeRepository.existsByEmailIgnoreCase(email)) {
      throw new LeadApiException(HttpStatus.CONFLICT, "Employee email already exists: " + email);
    }

    Employee employee = new Employee();
    employee.setId(UUID.randomUUID());
    employee.setName(request.name().trim());
    employee.setEmail(email);
    employee.setTelegramChatId(request.telegramChatId());
    employee.setTelegramUsername(normalizeUsername(request.telegramUsername()));
    employee.setActive(request.active() == null || request.active());
    employee.setCreatedAt(OffsetDateTime.now());

    return employeeMapper.toResponse(employeeRepository.save(employee));
  }

  @Transactional
  public EmployeeResponse updateEmployee(UUID id, EmployeeRequest request) {
    Employee employee = requireEmployee(id);
    String email = normalizeEmail(request.email());
    if (employeeRepository.existsByEmailIgnoreCaseAndIdNot(email, id)) {
      throw new LeadApiException(HttpStatus.CONFLICT, "Employee email already exists: " + email);
    }

    employee.setName(request.name().trim());
    employee.setEmail(email);
    employee.setTelegramChatId(request.telegramChatId());
    employee.setTelegramUsername(normalizeUsername(request.telegramUsername()));
    if (request.active() != null) {
      employee.setActive(request.active());
    }

    return employeeMapper.toResponse(employeeRepository.save(employee));
  }

  @Transactional
  public void deleteEmployee(UUID id) {
    Employee employee = requireEmployee(id);
    employeeRepository.delete(employee);
  }

  Employee requireEmployee(UUID id) {
    return employeeRepository
        .findById(id)
        .orElseThrow(() -> new ResourceNotFoundException("Employee not found: " + id));
  }

  private static String normalizeEmail(String email) {
    return email == null ? "" : email.trim().toLowerCase();
  }

  private static String normalizeUsername(String username) {
    if (!StringUtils.hasText(username)) {
      return null;
    }
    String trimmed = username.trim();
    return trimmed.startsWith("@") ? trimmed.substring(1) : trimmed;
  }
}
