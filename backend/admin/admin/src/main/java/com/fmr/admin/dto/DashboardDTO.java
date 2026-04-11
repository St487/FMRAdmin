package com.fmr.admin.dto;

import java.util.Map;
import java.util.List;

public class DashboardDTO {

  public Map<String, Long> statusCounts;
  public Map<String, Long> typeCounts;
  public List<String> dates;
  public List<Long> trendData;

  public int completed;
  public int total;
}
