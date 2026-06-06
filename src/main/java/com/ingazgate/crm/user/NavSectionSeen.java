package com.ingazgate.crm.user;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;
import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "nav_section_seen")
@IdClass(NavSectionSeenId.class)
public class NavSectionSeen {
  @Id
  @Column(name = "user_id", nullable = false)
  private UUID userId;

  @Id
  @Column(nullable = false, length = 32)
  private String section;

  @Column(name = "last_seen_at", nullable = false)
  private OffsetDateTime lastSeenAt;

  public UUID getUserId() {
    return userId;
  }

  public void setUserId(UUID userId) {
    this.userId = userId;
  }

  public String getSection() {
    return section;
  }

  public void setSection(String section) {
    this.section = section;
  }

  public OffsetDateTime getLastSeenAt() {
    return lastSeenAt;
  }

  public void setLastSeenAt(OffsetDateTime lastSeenAt) {
    this.lastSeenAt = lastSeenAt;
  }
}
