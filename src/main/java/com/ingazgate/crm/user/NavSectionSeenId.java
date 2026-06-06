package com.ingazgate.crm.user;

import java.io.Serializable;
import java.util.Objects;
import java.util.UUID;

public class NavSectionSeenId implements Serializable {
  private UUID userId;
  private String section;

  public NavSectionSeenId() {}

  public NavSectionSeenId(UUID userId, String section) {
    this.userId = userId;
    this.section = section;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof NavSectionSeenId that)) {
      return false;
    }
    return Objects.equals(userId, that.userId) && Objects.equals(section, that.section);
  }

  @Override
  public int hashCode() {
    return Objects.hash(userId, section);
  }
}
