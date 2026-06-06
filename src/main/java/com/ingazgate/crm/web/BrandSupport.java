package com.ingazgate.crm.web;

final class BrandSupport {
  static final String DEFAULT_NAME = "Student CRM";
  static final String LOGO_PATH = "/images/logo.png";
  static final String FAVICON_ICO_PATH = "/images/favicon.ico";
  static final String FAVICON_32_PATH = "/images/favicon-32.png";
  static final String APPLE_TOUCH_PATH = "/images/apple-touch-icon.png";
  static final String LOGO_CACHE_VERSION = "1";

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

  static String logoUrl() {
    return LOGO_PATH + "?v=" + LOGO_CACHE_VERSION;
  }

  static String favicon32Url() {
    return FAVICON_32_PATH + "?v=" + LOGO_CACHE_VERSION;
  }

  static String appleTouchUrl() {
    return APPLE_TOUCH_PATH + "?v=" + LOGO_CACHE_VERSION;
  }
}
