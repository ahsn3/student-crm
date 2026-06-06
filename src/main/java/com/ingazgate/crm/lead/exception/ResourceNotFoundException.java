package com.ingazgate.crm.lead.exception;

import org.springframework.http.HttpStatus;

public class ResourceNotFoundException extends LeadApiException {
  public ResourceNotFoundException(String message) {
    super(HttpStatus.NOT_FOUND, message);
  }
}
