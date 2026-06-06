package com.ingazgate.crm.asset;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.OffsetDateTime;
import java.util.UUID;

@Entity
@Table(name = "university")
public class University {
  @Id private UUID id;

  @Column(nullable = false)
  private String name;

  private String country;
  private String website;

  private String currency;

  @Column(name = "programs_count")
  private Integer programsCount;

  @Column(name = "campuses_count")
  private Integer campusesCount;

  @Column(name = "logo_url")
  private String logoUrl;

  @Column(columnDefinition = "TEXT")
  private String description;

  @Column(name = "created_at", nullable = false)
  private OffsetDateTime createdAt;

  public UUID getId() {
    return id;
  }

  public void setId(UUID id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getCountry() {
    return country;
  }

  public void setCountry(String country) {
    this.country = country;
  }

  public String getWebsite() {
    return website;
  }

  public void setWebsite(String website) {
    this.website = website;
  }

  public String getCurrency() {
    return currency;
  }

  public void setCurrency(String currency) {
    this.currency = currency;
  }

  public Integer getProgramsCount() {
    return programsCount;
  }

  public void setProgramsCount(Integer programsCount) {
    this.programsCount = programsCount;
  }

  public Integer getCampusesCount() {
    return campusesCount;
  }

  public void setCampusesCount(Integer campusesCount) {
    this.campusesCount = campusesCount;
  }

  public String getLogoUrl() {
    return logoUrl;
  }

  public void setLogoUrl(String logoUrl) {
    this.logoUrl = logoUrl;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public OffsetDateTime getCreatedAt() {
    return createdAt;
  }

  public void setCreatedAt(OffsetDateTime createdAt) {
    this.createdAt = createdAt;
  }
}
