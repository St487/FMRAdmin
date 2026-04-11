package com.fmr.admin.controller;

import com.fmr.admin.dto.UpdateReportDTO;
import com.fmr.admin.model.Report;
import com.fmr.admin.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/reports")
@CrossOrigin(origins = "*") // keep simple for Angular dev
public class ReportController {

  @Autowired
  private ReportService reportService;

  // GET ALL
  @GetMapping
  public List<Report> getAllReports() {
    return reportService.getAllReports();
  }

  // GET ONE
  @GetMapping("/{id}")
  public Report getReport(@PathVariable Long id) {
    return reportService.getReportById(id);
  }

  // UPDATE STATUS
  @PutMapping("/{id}")
  public Report updateReport(
    @PathVariable Long id,
    @RequestBody UpdateReportDTO dto
  ) {
    return reportService.updateReport(id, dto);
  }
}
