package com.ingazgate.crm.lead.service;

import com.ingazgate.crm.lead.entity.Employee;
import com.ingazgate.crm.lead.exception.AccessDeniedLeadException;
import com.ingazgate.crm.lead.repository.EmployeeRepository;
import com.ingazgate.crm.user.AppUser;
import org.springframework.stereotype.Service;

@Service
public class EmployeeAccessService {
  private final EmployeeRepository employeeRepository;

  public EmployeeAccessService(EmployeeRepository employeeRepository) {
    this.employeeRepository = employeeRepository;
  }

  public Employee requireLinkedEmployee(AppUser user) {
    if (user == null || user.getEmail() == null) {
      throw new AccessDeniedLeadException("User account is not linked to a sales employee profile");
    }
    return employeeRepository
        .findByEmailIgnoreCase(user.getEmail().trim())
        .orElseThrow(
            () ->
                new AccessDeniedLeadException(
                    "No sales employee profile found for " + user.getEmail()
                        + ". Ask admin to create an employee with the same email."));
  }

  public boolean isAdmin(AppUser user) {
    return user != null && "ADMIN".equalsIgnoreCase(user.getRole());
  }
}
