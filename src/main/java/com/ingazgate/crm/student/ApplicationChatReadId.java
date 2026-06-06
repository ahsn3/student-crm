package com.ingazgate.crm.student;

import java.io.Serializable;
import java.util.Objects;
import java.util.UUID;

public class ApplicationChatReadId implements Serializable {
  private UUID applicationId;
  private UUID userId;

  public ApplicationChatReadId() {}

  public ApplicationChatReadId(UUID applicationId, UUID userId) {
    this.applicationId = applicationId;
    this.userId = userId;
  }

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

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    ApplicationChatReadId that = (ApplicationChatReadId) o;
    return Objects.equals(applicationId, that.applicationId) && Objects.equals(userId, that.userId);
  }

  @Override
  public int hashCode() {
    return Objects.hash(applicationId, userId);
  }
}
