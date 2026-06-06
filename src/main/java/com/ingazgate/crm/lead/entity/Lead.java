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
@Table(name = "crm_lead")
@Getter
@Setter
@NoArgsConstructor
public class Lead {
  @Id private UUID id;

  @Column(nullable = false)
  private String name;

  private String phone;

  private String email;

  private String company;

  @Column(name = "service_requested")
  private String serviceRequested;

  private String notes;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false)
  private LeadStatus status = LeadStatus.NEW;

  private String source;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "assigned_employee_id")
  private Employee assignedEmployee;

  @Column(name = "created_at", nullable = false)
  private OffsetDateTime createdAt;
}
