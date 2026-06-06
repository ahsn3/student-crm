package com.ingazgate.crm.lead.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.OffsetDateTime;
import java.util.UUID;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "employee")
@Getter
@Setter
@NoArgsConstructor
public class Employee {
  @Id private UUID id;

  @Column(nullable = false)
  private String name;

  @Column(nullable = false, unique = true)
  private String email;

  @Column(name = "telegram_chat_id")
  private Long telegramChatId;

  @Column(name = "telegram_username")
  private String telegramUsername;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false)
  private EmployeeDepartment department = EmployeeDepartment.REGISTRATION;

  @Column(nullable = false)
  private boolean active = true;

  @Column(name = "last_assigned_at")
  private OffsetDateTime lastAssignedAt;

  @Column(name = "created_at", nullable = false)
  private OffsetDateTime createdAt;
}
