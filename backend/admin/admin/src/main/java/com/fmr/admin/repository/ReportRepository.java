package com.fmr.admin.repository;

import com.fmr.admin.model.Report;
import org.springframework.data.jpa.repository.*;
import java.util.List;

public interface ReportRepository extends JpaRepository<Report, Long> {

  @Query("SELECT r.status, COUNT(r) FROM Report r GROUP BY r.status")
  List<Object[]> countByStatus();

  @Query("SELECT r.issueType, COUNT(r) FROM Report r GROUP BY r.issueType")
  List<Object[]> countByType();

  @Query("SELECT r FROM Report r LEFT JOIN FETCH r.user")
  List<Report> findAllReports();
}
