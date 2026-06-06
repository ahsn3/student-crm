package com.ingazgate.crm.lead.exception;

import org.springframework.http.HttpStatus;

public class WhatsAppDeliveryException extends LeadApiException {
  public WhatsAppDeliveryException(String message) {
    super(HttpStatus.BAD_GATEWAY, message);
  }

  public WhatsAppDeliveryException(String message, Throwable cause) {
    super(HttpStatus.BAD_GATEWAY, message, cause);
  }
}
