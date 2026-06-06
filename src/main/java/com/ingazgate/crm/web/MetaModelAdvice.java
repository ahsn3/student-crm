package com.ingazgate.crm.web;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@ControllerAdvice
public class MetaModelAdvice {
  @Value("${app.meta.site-url:}")
  private String siteUrl;

  @Value("${app.meta.site-name:Student CRM}")
  private String siteName;

  @Value("${app.meta.description:Student CRM helps education agencies manage students, applications, universities, and documents in one place.}")
  private String description;

  @ModelAttribute
  void shellLayoutDefaults(Model model) {
    if (!model.containsAttribute("bodyPageClass")) {
      model.addAttribute("bodyPageClass", "");
    }
  }

  @ModelAttribute("metaSiteName")
  String metaSiteName() {
    return BrandSupport.displayName(siteName);
  }

  @ModelAttribute("metaDescription")
  String metaDescription() {
    return description;
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
    String normalized = normalizeSiteUrl(siteUrl);
    if (!normalized.isEmpty()) {
      return normalized + BrandSupport.LOGO_PATH;
    }
    return ServletUriComponentsBuilder.fromContextPath(request)
        .path(BrandSupport.LOGO_PATH)
        .build()
        .toUriString();
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

