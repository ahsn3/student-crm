package com.ingazgate.crm.support;

import com.ingazgate.crm.user.AppUser;

/** How users appear in notifications and chat — agents by office, staff by display name. */
public final class UserDisplayNames {
  private UserDisplayNames() {}

  /** Label for notifications and chat; agents use office name (e.g. Oktamam), not login email. */
  public static String actorLabel(AppUser user, boolean isStaff) {
    if (user == null) {
      return "User";
    }
    if (!isStaff) {
      String office = trim(user.getOfficeName());
      if (office != null) {
        return office;
      }
      String domain = user.getEmailDomain();
      if (domain != null && !domain.isBlank()) {
        return officeNameFromDomain(domain.trim().toLowerCase());
      }
    }
    String display = trim(user.getDisplayName());
    if (display != null) {
      return display;
    }
    String email = trim(user.getEmail());
    return email != null ? email : "User";
  }

  static String officeNameFromDomain(String domain) {
    int dot = domain.indexOf('.');
    String label = dot > 0 ? domain.substring(0, dot) : domain;
    if (label.isEmpty()) {
      return label;
    }
    return Character.toUpperCase(label.charAt(0))
        + (label.length() > 1 ? label.substring(1).toLowerCase() : "");
  }

  private static String trim(String value) {
    if (value == null) {
      return null;
    }
    String t = value.trim();
    return t.isEmpty() ? null : t;
  }
}
