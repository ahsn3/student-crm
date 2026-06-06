package com.ingazgate.crm.web;

import jakarta.servlet.http.HttpServletRequest;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@ControllerAdvice
public class MetaModelAdvice {
  private final MessageSource messageSource;

  @Value("${app.meta.site-url:}")
  private String siteUrl;

  @Value("${app.meta.site-name:Student CRM}")
  private String siteName;

  @Value("${app.meta.description:Student CRM helps education agencies manage students, applications, universities, and documents in one place.}")
  private String description;

  public MetaModelAdvice(MessageSource messageSource) {
    this.messageSource = messageSource;
  }

  @ModelAttribute
  void shellLayoutDefaults(Model model) {
    if (!model.containsAttribute("bodyPageClass")) {
      model.addAttribute("bodyPageClass", "");
    }
  }

  @ModelAttribute("metaSiteName")
  String metaSiteName() {
    return resolveBrandName();
  }

  @ModelAttribute("metaDescription")
  String metaDescription() {
    Locale locale = LocaleContextHolder.getLocale();
    try {
      return messageSource.getMessage("brand.metaDescription", null, locale);
    } catch (NoSuchMessageException ex) {
      return description;
    }
  }

  @ModelAttribute("metaUrl")
  String metaUrl(HttpServletRequest request) {
    String normalized = normalizeSiteUrl(siteUrl);
    if (!normalized.isEmpty()) {
      String path = request.getRequestURI();
      String query = request.getQueryString();
      if (query != null && !query.isBlank()) {
        return normalized + path + "?" + query;
      }
      return normalized + path;
    }
    return ServletUriComponentsBuilder.fromRequest(request).build().toUriString();
  }

  @ModelAttribute("metaImageUrl")
  String metaImageUrl(HttpServletRequest request) {
    String logoPath = BrandSupport.logoUrl();
    String normalized = normalizeSiteUrl(siteUrl);
    if (!normalized.isEmpty()) {
      return normalized + logoPath;
    }
    return ServletUriComponentsBuilder.fromContextPath(request).path(logoPath).build().toUriString();
  }

  @ModelAttribute("metaBrandLogoUrl")
  String metaBrandLogoUrl(HttpServletRequest request) {
    return metaImageUrl(request);
  }

  private String resolveBrandName() {
    String configured = BrandSupport.displayName(siteName);
    if (!configured.equals(BrandSupport.DEFAULT_NAME)) {
      return configured;
    }
    Locale locale = LocaleContextHolder.getLocale();
    try {
      return messageSource.getMessage("brand.name", null, locale);
    } catch (NoSuchMessageException ex) {
      return configured;
    }
  }

  private String normalizeSiteUrl(String value) {
    if (value == null) {
      return "";
    }
    String trimmed = value.trim();
    if (trimmed.endsWith("/")) {
      return trimmed.substring(0, trimmed.length() - 1);
    }
    return trimmed;
  }
}
