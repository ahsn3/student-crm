package com.ingazgate.crm.support;

import java.time.Instant;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import org.springframework.stereotype.Component;

/** Formats instants for UI in Turkey time ({@code Europe/Istanbul}). */
@Component("displayTime")
public class DisplayTime {
  public static final ZoneId ZONE = ZoneId.of("Europe/Istanbul");

  public String format(OffsetDateTime value, String pattern) {
    if (value == null) {
      return "";
    }
    return DateTimeFormatter.ofPattern(pattern).format(value.atZoneSameInstant(ZONE));
  }

  public String format(Instant value, String pattern) {
    if (value == null) {
      return "";
    }
    return DateTimeFormatter.ofPattern(pattern).format(value.atZone(ZONE));
  }

  public String format(LocalDate value, String pattern) {
    if (value == null) {
      return "";
    }
    return DateTimeFormatter.ofPattern(pattern).format(value);
  }
}
