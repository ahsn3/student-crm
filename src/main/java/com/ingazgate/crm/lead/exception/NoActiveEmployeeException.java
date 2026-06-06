package com.ingazgate.crm.lead.exception;

import org.springframework.http.HttpStatus;

public class NoActiveEmployeeException extends LeadApiException {
  public NoActiveEmployeeException() {
    super(HttpStatus.CONFLICT, "No active employees available for lead assignment");
  }
}
