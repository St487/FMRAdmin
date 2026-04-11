package com.fmr.admin.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "report")
public class Report {

  public User getUser() {
    return user;
  }

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long reportId;

  private Long userId;

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "userId", insertable = false, updatable = false)
  @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
  private User user;

  private String issueType;
  private String title;
  private String description;

  private String locationText;
  private Double latitude;
  private Double longitude;

  private String photo1;
  private String photo2;
  private String photo3;

  private String status;
  private Long updatedBy;

  private LocalDateTime createdAt;
  private LocalDateTime updatedAt;

  public Long getReportId() { return reportId; }
  public void setReportId(Long reportId) { this.reportId = reportId; }

  public Long getUserId() { return userId; }
  public void setUserId(Long userId) { this.userId = userId; }

  public String getIssueType() { return issueType; }
  public void setIssueType(String issueType) { this.issueType = issueType; }

  public String getTitle() { return title; }
  public void setTitle(String title) { this.title = title; }

  public String getDescription() { return description; }
  public void setDescription(String description) { this.description = description; }

  public String getLocationText() { return locationText; }
  public void setLocationText(String locationText) { this.locationText = locationText; }

  public Double getLatitude() { return latitude; }
  public void setLatitude(Double latitude) { this.latitude = latitude; }

  public Double getLongitude() { return longitude; }
  public void setLongitude(Double longitude) { this.longitude = longitude; }

  public String getPhoto1() { return photo1; }
  public void setPhoto1(String photo1) { this.photo1 = photo1; }

  public String getPhoto2() { return photo2; }
  public void setPhoto2(String photo2) { this.photo2 = photo2; }

  public String getPhoto3() { return photo3; }
  public void setPhoto3(String photo3) { this.photo3 = photo3; }

  public String getStatus() { return status; }
  public void setStatus(String status) { this.status = status; }

  public Long getUpdatedBy() { return updatedBy; }
  public void setUpdatedBy(Long updatedBy) { this.updatedBy = updatedBy; }

  public LocalDateTime getCreatedAt() { return createdAt; }
  public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

  public LocalDateTime getUpdatedAt() { return updatedAt; }
  public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
}
