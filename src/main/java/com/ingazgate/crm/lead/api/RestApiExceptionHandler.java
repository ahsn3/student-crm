package com.ingazgate.crm.lead.api;

import com.ingazgate.crm.lead.dto.ApiErrorResponse;
import com.ingazgate.crm.lead.exception.LeadApiException;
import java.time.OffsetDateTime;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice(basePackages = "com.ingazgate.crm.lead.api")
public class RestApiExceptionHandler {
  private static final Logger log = LoggerFactory.getLogger(RestApiExceptionHandler.class);

  @ExceptionHandler(LeadApiException.class)
  ResponseEntity<ApiErrorResponse> handleLeadApiException(LeadApiException ex) {
    log.warn("Lead API error: {}", ex.getMessage());
    return ResponseEntity.status(ex.getStatus())
        .body(new ApiErrorResponse(ex.getStatus().value(), ex.getStatus().getReasonPhrase(), ex.getMessage(), OffsetDateTime.now()));
  }

  @ExceptionHandler(MethodArgumentNotValidException.class)
  ResponseEntity<ApiErrorResponse> handleValidation(MethodArgumentNotValidException ex) {
    String message =
        ex.getBindingResult().getFieldErrors().stream()
            .map(this::formatFieldError)
            .collect(Collectors.joining("; "));
    return ResponseEntity.status(HttpStatus.BAD_REQUEST)
        .body(new ApiErrorResponse(400, "Bad Request", message, OffsetDateTime.now()));
  }

  @ExceptionHandler(Exception.class)
  ResponseEntity<ApiErrorResponse> handleUnexpected(Exception ex) {
    log.error("Unexpected lead API error", ex);
    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
        .body(
            new ApiErrorResponse(
                500,
                "Internal Server Error",
                "An unexpected error occurred",
                OffsetDateTime.now()));
  }

  private String formatFieldError(FieldError error) {
    return error.getField() + ": " + error.getDefaultMessage();
  }
}
