package com.ingazgate.crm.lead.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.OffsetDateTime;
import java.util.UUID;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "lead_status_history")
@Getter
@Setter
@NoArgsConstructor
public class LeadStatusHistory {
  @Id private UUID id;

  @ManyToOne(fetch = FetchType.LAZY, optional = false)
  @JoinColumn(name = "lead_id", nullable = false)
  private Lead lead;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "employee_id")
  private Employee employee;

  @Enumerated(EnumType.STRING)
  @Column(name = "old_status")
  private LeadStatus oldStatus;

  @Enumerated(EnumType.STRING)
  @Column(name = "new_status", nullable = false)
  private LeadStatus newStatus;

  @Column(name = "changed_at", nullable = false)
  private OffsetDateTime changedAt;
}
