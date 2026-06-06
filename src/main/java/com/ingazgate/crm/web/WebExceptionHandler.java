package com.ingazgate.crm.web;

import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.server.ResponseStatusException;

@ControllerAdvice
public class WebExceptionHandler {
  private static final Logger log = LoggerFactory.getLogger(WebExceptionHandler.class);

  private final MessageSource messageSource;

  public WebExceptionHandler(MessageSource messageSource) {
    this.messageSource = messageSource;
  }

  @ExceptionHandler(ResponseStatusException.class)
  public String handleStatus(HttpServletRequest request, ResponseStatusException ex, Model model) {
    HttpStatus status = HttpStatus.resolve(ex.getStatusCode().value());
    if (status == null) {
      status = HttpStatus.INTERNAL_SERVER_ERROR;
    }
    if (status == HttpStatus.NOT_FOUND) {
      return errorPage(model, "error.notFound.title", "error.notFound.subtitle");
    }
    if (status == HttpStatus.FORBIDDEN || status == HttpStatus.UNAUTHORIZED) {
      return errorPage(model, "error.forbidden.title", "error.forbidden.subtitle");
    }
    log.warn("{} {} → {}", request.getMethod(), request.getRequestURI(), status.value());
    return errorPage(model, "error.load.title", "error.load.subtitle");
  }

  @ExceptionHandler(RuntimeException.class)
  public String handleUnexpected(HttpServletRequest request, RuntimeException ex, Model model) {
    if (ex instanceof ResponseStatusException rse) {
      throw rse;
    }
    log.error("Unhandled error for {} {}", request.getMethod(), request.getRequestURI(), ex);
    return errorPage(model, "error.load.title", "error.load.subtitle");
  }

  private String errorPage(Model model, String titleKey, String subtitleKey) {
    model.addAttribute("pageTitleKey", "page.defaultTitle");
    model.addAttribute("activeNav", "");
    model.addAttribute("contentTemplate", "pages/error-load");
    model.addAttribute("errorTitle", msg(titleKey));
    model.addAttribute("errorSubtitle", msg(subtitleKey));
    return "layout/shell";
  }

  private String msg(String key) {
    try {
      return messageSource.getMessage(key, null, LocaleContextHolder.getLocale());
    } catch (Exception ex) {
      return key;
    }
  }
}
