package com.ingazgate.crm.web;

final class BrandSupport {
  static final String DEFAULT_NAME = "Student CRM";
  static final String LOGO_PATH = "/images/logo.svg";

  private BrandSupport() {}

  static String displayName(String configured) {
    if (configured == null || configured.isBlank()) {
      return DEFAULT_NAME;
    }
    String trimmed = configured.trim();
    if (trimmed.toLowerCase().contains("ingazgate")) {
      return DEFAULT_NAME;
    }
    return trimmed;
  }
}
