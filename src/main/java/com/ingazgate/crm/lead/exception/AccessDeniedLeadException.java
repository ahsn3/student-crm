package com.ingazgate.crm.lead.exception;

import org.springframework.http.HttpStatus;

public class AccessDeniedLeadException extends LeadApiException {
  public AccessDeniedLeadException(String message) {
    super(HttpStatus.FORBIDDEN, message);
  }
}
