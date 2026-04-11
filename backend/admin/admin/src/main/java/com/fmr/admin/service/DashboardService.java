package com.fmr.admin.service;

import com.fmr.admin.dto.DashboardDTO;
import com.fmr.admin.model.Report;
import com.fmr.admin.repository.ReportRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;

@Service
public class DashboardService {

  private final ReportRepository repo;

  public DashboardService(ReportRepository repo) {
    this.repo = repo;
  }

  public DashboardDTO getDashboardData(String range) {

    DashboardDTO dto = new DashboardDTO();

    LocalDateTime fromDate;

    switch (range) {
      case "30":
        fromDate = LocalDateTime.now().minusDays(30);
        break;
      case "60":
        fromDate = LocalDateTime.now().minusDays(60);
        break;
      case "90":
        fromDate = LocalDateTime.now().minusDays(90);
        break;
      default:
        fromDate = LocalDateTime.of(1970, 1, 1, 0, 0);
    }

    List<Report> allReports = repo.findAllReports();

    List<Report> filtered = allReports.stream()
      .filter(r -> r.getCreatedAt() != null && r.getCreatedAt().isAfter(fromDate))
      .toList();

    Map<String, Long> statusMap = new HashMap<>();
    for (Report r : filtered) {
      statusMap.put(r.getStatus(),
        statusMap.getOrDefault(r.getStatus(), 0L) + 1);
    }
    dto.statusCounts = statusMap;

    Map<String, Long> typeMap = new HashMap<>();
    for (Report r : filtered) {
      typeMap.put(r.getIssueType(),
        typeMap.getOrDefault(r.getIssueType(), 0L) + 1);
    }
    dto.typeCounts = typeMap;

    Map<String, Long> trendMap = new LinkedHashMap<>();

    for (Report r : filtered) {
      String date = r.getCreatedAt().toLocalDate().toString();
      trendMap.put(date, trendMap.getOrDefault(date, 0L) + 1);
    }

    dto.dates = new ArrayList<>(trendMap.keySet());
    dto.trendData = new ArrayList<>(trendMap.values());

    long completed = filtered.stream()
      .filter(r -> "completed".equalsIgnoreCase(r.getStatus()))
      .count();

    dto.completed = (int) completed;
    dto.total = filtered.size();

    return dto;
  }
}
