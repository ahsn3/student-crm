package com.ingazgate.crm.web;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Locale;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PageTitleMessageInterceptor implements HandlerInterceptor {

  private final MessageSource messageSource;

  public PageTitleMessageInterceptor(MessageSource messageSource) {
    this.messageSource = messageSource;
  }

  @Override
  public void postHandle(
      HttpServletRequest request,
      HttpServletResponse response,
      Object handler,
      ModelAndView modelAndView) {
    if (modelAndView == null) {
      return;
    }
    var model = modelAndView.getModelMap();
    Locale locale = LocaleContextHolder.getLocale();
    if (model.containsAttribute("pageTitleKey")) {
      Object keyObj = model.get("pageTitleKey");
      if (keyObj instanceof String key && !key.isBlank()) {
        model.addAttribute("pageTitle", resolveMessage(key, locale));
      }
    }
    if (!model.containsAttribute("pageTitle") || model.get("pageTitle") == null) {
      model.addAttribute("pageTitle", resolveMessage("page.defaultTitle", locale));
    }
  }

  private String resolveMessage(String key, Locale locale) {
    try {
      return messageSource.getMessage(key, null, locale);
    } catch (NoSuchMessageException ex) {
      return key;
    }
  }
}
