package com.ingazgate.crm.theme;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ThemeRamaService {

  @Value("${app.theme.rama-emails:}")
  private String ramaEmailsCsv;

  public boolean isRamaUser(String email) {
    if (email == null || email.isBlank()) {
      return false;
    }
    String e = email.trim().toLowerCase();
    if (ramaEmailsCsv == null || ramaEmailsCsv.isBlank()) {
      return false;
    }
    for (String part : ramaEmailsCsv.split(",")) {
      String p = part.trim().toLowerCase();
      if (!p.isEmpty() && e.equals(p)) {
        return true;
      }
    }
    return false;
  }
}
