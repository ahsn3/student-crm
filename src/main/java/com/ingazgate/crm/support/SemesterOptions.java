package com.ingazgate.crm.support;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

public final class SemesterOptions {
  private SemesterOptions() {}

  /** Fall and Spring for the upcoming academic year (2026/2027). */
  public static List<String> currentYearTerms() {
    return List.of("Fall 2026/2027", "Spring 2026/2027");
  }

  /** Current Fall/Spring terms plus any semesters already stored (for filters and edit). */
  public static List<String> withStoredTerms(List<String> fromDb) {
    LinkedHashSet<String> merged = new LinkedHashSet<>(currentYearTerms());
    if (fromDb != null) {
      for (String s : fromDb) {
        if (s != null && !s.isBlank()) {
          merged.add(s.trim());
        }
      }
    }
    return new ArrayList<>(merged);
  }

  public static List<String> withStoredTermsAndExtra(List<String> fromDb, String extra) {
    LinkedHashSet<String> merged = new LinkedHashSet<>(withStoredTerms(fromDb));
    if (extra != null && !extra.isBlank()) {
      merged.add(extra.trim());
    }
    return new ArrayList<>(merged);
  }
}
