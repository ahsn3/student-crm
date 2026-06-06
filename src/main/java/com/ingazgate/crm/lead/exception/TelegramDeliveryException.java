package com.ingazgate.crm.lead.exception;

import org.springframework.http.HttpStatus;

public class TelegramDeliveryException extends LeadApiException {
  public TelegramDeliveryException(String message) {
    super(HttpStatus.BAD_GATEWAY, message);
  }

  public TelegramDeliveryException(String message, Throwable cause) {
    super(HttpStatus.BAD_GATEWAY, message, cause);
  }
}
