package com.ingazgate.crm.web;

import java.time.Duration;
import java.util.Locale;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

@Configuration
public class LocaleConfig {

  static final String LOCALE_COOKIE = "STUDENT_CRM_LANG";

  @Bean
  LocaleResolver localeResolver() {
    CookieLocaleResolver resolver = new CookieLocaleResolver();
    resolver.setCookieName(LOCALE_COOKIE);
    resolver.setDefaultLocale(Locale.ENGLISH);
    resolver.setCookieMaxAge((int) Duration.ofDays(365).getSeconds());
    return resolver;
  }
}
