package com.ingazgate.crm.config;

import jakarta.annotation.PostConstruct;
import java.util.TimeZone;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppTimezoneConfig {

  @PostConstruct
  void useTurkeyTime() {
    TimeZone.setDefault(TimeZone.getTimeZone("Europe/Istanbul"));
  }
}
