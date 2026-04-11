package com.fmr.admin.dto;

public class UpdateReportDTO {

  private String status;
  private Long updatedBy;

  public String getStatus() { return status; }
  public void setStatus(String status) { this.status = status; }

  public Long getUpdatedBy() { return updatedBy; }
  public void setUpdatedBy(Long updatedBy) { this.updatedBy = updatedBy; }
}
