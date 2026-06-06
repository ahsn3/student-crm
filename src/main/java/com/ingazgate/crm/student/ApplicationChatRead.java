package com.ingazgate.crm.student;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;
import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "application_chat_read")
@IdClass(ApplicationChatReadId.class)
public class ApplicationChatRead {
  @Id
  @Column(name = "application_id", nullable = false)
  private UUID applicationId;

  @Id
  @Column(name = "user_id", nullable = false)
  private UUID userId;

  @Column(name = "last_read_at", nullable = false)
  private OffsetDateTime lastReadAt;

  public UUID getApplicationId() {
    return applicationId;
  }

  public void setApplicationId(UUID applicationId) {
    this.applicationId = applicationId;
  }

  public UUID getUserId() {
    return userId;
  }

  public void setUserId(UUID userId) {
    this.userId = userId;
  }

  public OffsetDateTime getLastReadAt() {
    return lastReadAt;
  }

  public void setLastReadAt(OffsetDateTime lastReadAt) {
    this.lastReadAt = lastReadAt;
  }
}
