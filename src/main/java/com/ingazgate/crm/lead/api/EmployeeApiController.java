package com.ingazgate.crm.lead.api;

import com.ingazgate.crm.lead.dto.EmployeeRequest;
import com.ingazgate.crm.lead.dto.EmployeeResponse;
import com.ingazgate.crm.lead.service.EmployeeService;
import jakarta.validation.Valid;
import java.util.List;
import java.util.UUID;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/employees")
public class EmployeeApiController {
  private final EmployeeService employeeService;

  public EmployeeApiController(EmployeeService employeeService) {
    this.employeeService = employeeService;
  }

  @GetMapping
  List<EmployeeResponse> list() {
    return employeeService.listEmployees();
  }

  @GetMapping("/{id}")
  EmployeeResponse get(@PathVariable UUID id) {
    return employeeService.getEmployee(id);
  }

  @PostMapping
  ResponseEntity<EmployeeResponse> create(@Valid @RequestBody EmployeeRequest request) {
    EmployeeResponse created = employeeService.createEmployee(request);
    return ResponseEntity.status(HttpStatus.CREATED).body(created);
  }

  @PutMapping("/{id}")
  EmployeeResponse update(@PathVariable UUID id, @Valid @RequestBody EmployeeRequest request) {
    return employeeService.updateEmployee(id, request);
  }

  @DeleteMapping("/{id}")
  ResponseEntity<Void> delete(@PathVariable UUID id) {
    employeeService.deleteEmployee(id);
    return ResponseEntity.noContent().build();
  }
}
