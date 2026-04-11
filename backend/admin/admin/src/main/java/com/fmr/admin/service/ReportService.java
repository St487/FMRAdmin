package com.fmr.admin.service;

import com.fmr.admin.dto.UpdateReportDTO;
import com.fmr.admin.model.Report;
import com.fmr.admin.repository.ReportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ReportService {

  @Autowired
  private ReportRepository reportRepository;

  // GET ALL REPORTS (FIXED)
  public List<Report> getAllReports() {
    return reportRepository.findAllReports();
  }

  // GET BY ID
  public Report getReportById(Long id) {
    return reportRepository.findById(id)
      .orElseThrow(() -> new RuntimeException("Report not found"));
  }

  // UPDATE STATUS
  public Report updateReport(Long id, UpdateReportDTO dto) {
    Report report = getReportById(id);

    report.setStatus(dto.getStatus());
    report.setUpdatedBy(dto.getUpdatedBy());
    report.setUpdatedAt(LocalDateTime.now());

    return reportRepository.save(report);
  }
}
