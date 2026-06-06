package com.ingazgate.crm.lead.service;

import com.ingazgate.crm.lead.entity.EmployeeDepartment;
import com.ingazgate.crm.lead.entity.LeadType;

public final class LeadDepartmentRouter {
  private LeadDepartmentRouter() {}

  public static EmployeeDepartment departmentFor(LeadType leadType) {
    if (leadType == null) {
      return EmployeeDepartment.REGISTRATION;
    }
    return switch (leadType) {
      case REGISTRATION, EQUIVALENCY, GENERAL_INQUIRY -> EmployeeDepartment.REGISTRATION;
      case UNIVERSITY_TRANSFER -> EmployeeDepartment.TRANSFER;
      case MASTER_APPLICATION, PHD_APPLICATION, SCHOLARSHIP -> EmployeeDepartment.POSTGRADUATE;
      case RESIDENCE_PERMIT -> EmployeeDepartment.RESIDENCE;
    };
  }
}
