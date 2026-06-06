package com.ingazgate.crm.util;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

public final class NationalityCatalog {
  private NationalityCatalog() {}

  /** Display country names (English), sorted, de-duplicated for UI pickers. */
  public static List<String> sortedDisplayNames() {
    Set<String> seen = new LinkedHashSet<>();
    for (String code : Locale.getISOCountries()) {
      if (code == null || code.isBlank()) {
        continue;
      }
      Locale loc = new Locale.Builder().setRegion(code).build();
      String label = loc.getDisplayCountry(Locale.ENGLISH);
      if (label == null || label.isBlank()) {
        continue;
      }
      seen.add(label.trim());
    }
    List<String> list = new ArrayList<>(seen);
    list.sort(Comparator.comparing(String::toLowerCase));
    return List.copyOf(list);
  }
}
