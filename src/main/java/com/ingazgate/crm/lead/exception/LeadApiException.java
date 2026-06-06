package com.ingazgate.crm.lead.exception;

import org.springframework.http.HttpStatus;

public class LeadApiException extends RuntimeException {
  private final HttpStatus status;

  public LeadApiException(HttpStatus status, String message) {
    super(message);
    this.status = status;
  }

  public LeadApiException(HttpStatus status, String message, Throwable cause) {
    super(message, cause);
    this.status = status;
  }

  public HttpStatus getStatus() {
    return status;
  }
}
