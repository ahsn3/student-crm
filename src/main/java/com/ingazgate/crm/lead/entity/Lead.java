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

  @Enumerated(EnumType.STRING)
  @Column(name = "lead_type", nullable = false)
  private LeadType leadType = LeadType.GENERAL_INQUIRY;

  @Column(name = "student_name", nullable = false)
  private String studentName;

  private String phone;

  private String email;

  private String nationality;

  @Column(name = "current_university")
  private String currentUniversity;

  @Column(name = "target_university")
  private String targetUniversity;

  @Column(name = "current_major")
  private String currentMajor;

  @Column(name = "desired_major")
  private String desiredMajor;

  @Column(name = "study_year")
  private String studyYear;

  @Column(name = "degree_level")
  private String degreeLevel;

  private String notes;

  @Enumerated(EnumType.STRING)
  @Column(nullable = false)
  private LeadStatus status = LeadStatus.NEW;

  private String source;

  /** Legacy columns kept for older rows. */
  private String company;

  @Column(name = "service_requested")
  private String serviceRequested;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "assigned_employee_id")
  private Employee assignedEmployee;

  @Column(name = "created_at", nullable = false)
  private OffsetDateTime createdAt;
}
