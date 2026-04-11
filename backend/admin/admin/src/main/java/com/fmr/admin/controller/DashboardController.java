package com.fmr.admin.controller;

import com.fmr.admin.dto.DashboardDTO;
import com.fmr.admin.service.DashboardService;
import org.springframework.web.bind.annotation.*;
import jakarta.annotation.PostConstruct;

@RestController
@RequestMapping("/api/dashboard")
@CrossOrigin(origins = "*")
public class DashboardController {

  private final DashboardService service;

  public DashboardController(DashboardService service) {
    this.service = service;
  }

  @PostConstruct
  public void init() {
    System.out.println("DashboardController LOADED");
  }

  @GetMapping
  public DashboardDTO getDashboard(
    @RequestParam(defaultValue = "30") String range
  ) {
    return service.getDashboardData(range);
  }
}
