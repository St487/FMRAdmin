import { Chart } from 'chart.js/auto';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import jsPDF from 'jspdf';
import html2canvas from 'html2canvas';
import { Component, AfterViewInit, ViewChild, ElementRef } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { isPlatformBrowser } from '@angular/common';
import { PLATFORM_ID, Inject } from '@angular/core';

@Component({
selector: 'app-dashboard',
standalone: true,
imports: [CommonModule],
templateUrl: './dashboard.html',
styleUrl: './dashboard.css'
})
export class Dashboard implements AfterViewInit {

completedThisWeek = 32;
totalThisWeek = 50;
selectedRange: string = '30';
@ViewChild('statusChart') statusChartRef!: ElementRef;
@ViewChild('trendChart') trendChartRef!: ElementRef;
@ViewChild('typeChart') typeChartRef!: ElementRef;

  constructor(
    private http: HttpClient,
    private router: Router,
    @Inject(PLATFORM_ID) private platformId: Object
  ) {}

  statusSummary: any = {};

  get completionRate(): number {
    return Math.round((this.completedThisWeek / this.totalThisWeek) * 100);
  }

  ngAfterViewInit() {
    if (!isPlatformBrowser(this.platformId)) return;

    this.http.get<any>('http://localhost:8080/api/dashboard')
      .subscribe({
        next: (data) => {
          this.completedThisWeek = data.completed;
          this.totalThisWeek = data.total;

          this.statusSummary = data.statusCounts;

          setTimeout(() => {
            this.loadCharts(data);
          }, 0);
        }
      });
  }

  loadCharts(data: any) {
    // Define a modern color palette
    const colors = {
      primary: '#2563eb',
      success: '#10b981',
      warning: '#f59e0b',
      danger: '#ef4444',
      indigo: '#6366f1',
      slate: '#94a3b8'
    };

    // Global Defaults for cleaner look
    Chart.defaults.font.family = "'Inter', sans-serif";
    Chart.defaults.color = '#64748b';
    Chart.defaults.plugins.legend.labels.usePointStyle = true;

    const statusLabels: { [key: string]: string } = {
      'pending': 'Pending',
      'approved': 'Approved',
      'in_progress': 'In Progress',
      'rejected': 'Rejected',
      'completed': 'Completed'
    };

    // 1. PIE CHART (Status)
    const statusColors: { [key: string]: string } = {
      'pending': '#f59e0b',       // Yellow
      'approved': '#6366f1',      // Dark Green
      'in_progress': '#3b82f6',   // Blue
      'rejected': '#ef4444',      // Red
      'completed': '#10b981'     // Light Green
    };

    // 2. FIXED ORDER
    const statusOrder = [
      'pending',
      'approved',
      'in_progress',
      'rejected',
      'completed'
    ];

    // 3. BUILD SORTED DATA (VERY IMPORTANT)
    const sortedLabels = statusOrder
      .filter(status => data.statusCounts?.[status] !== undefined)
      .map(status => statusLabels[status]);

    const sortedValues = statusOrder
      .filter(status => data.statusCounts?.[status] !== undefined)
      .map(status => data.statusCounts[status]);

    const sortedColors = statusOrder
      .filter(status => data.statusCounts?.[status] !== undefined)
      .map(status => statusColors[status]);

    // 4. DOUGHNUT CHART
    new Chart(this.statusChartRef.nativeElement, {
      type: 'doughnut',
      data: {
        labels: sortedLabels,
        datasets: [{
          data: sortedValues,
          backgroundColor: sortedColors,
          borderWidth: 0,
          hoverOffset: 15
        }]
      },
      options: {
        cutout: '70%',
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              usePointStyle: true,
              padding: 18
            }
          }
        }
      }
    });

    // 2. LINE CHART (Trend)
    new Chart(this.trendChartRef.nativeElement, {
      type: 'line',
      data: {
        labels: data.dates,
        datasets: [{
          label: 'Reports',
          data: data.trendData,
          borderColor: colors.primary,
          backgroundColor: 'rgba(37, 99, 235, 0.1)', // Light blue fill
          fill: true,
          tension: 0.4, // Smooth curves
          pointRadius: 4,
          pointBackgroundColor: colors.primary,
          borderWidth: 3
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: { legend: { display: false } },
        scales: {
          y: { beginAtZero: true, grid: { display: false } },
          x: { grid: { display: false } }
        }
      }
    });

    // 3. BAR CHART (Type)
    new Chart(this.typeChartRef.nativeElement, {
      type: 'bar',
      data: {
        labels: Object.keys(data.typeCounts),
        datasets: [{
          data: Object.values(data.typeCounts),
          backgroundColor: colors.indigo,
          borderRadius: 8,
          barThickness: 40,
        }]
      },
      options: {
        indexAxis: 'x',
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: { display: false }
        },
        scales: {
          y: {
            border: {
              display: false,
              dash: [5, 5]
            },
            grid: {
              display: true,
              color: 'rgba(0, 0, 0, 0.05)'
            }
          },
          x: {
            grid: { display: false },
            border: { display: false },

            ticks: {
              maxRotation: 0,
              minRotation: 0,
              autoSkip: false   // ✅ SHOW ALL LABELS
            }
          }
        }
      }
    });
  }

  exportPDF() {
    const data = document.body;

    html2canvas(data).then(canvas => {
      const imgWidth = 210;
      const imgHeight = canvas.height * imgWidth / canvas.width;

      const contentDataURL = canvas.toDataURL('image/png');
      const pdf = new jsPDF('p', 'mm', 'a4');

      pdf.addImage(contentDataURL, 'PNG', 0, 0, imgWidth, imgHeight);
      pdf.save('dashboard-report.pdf');
    });
  }

  filterReports(status: string) {
    console.log('Filtering reports by:', status);
  }

  logout() {
    this.router.navigate(['/login']);
  }

  onTimeFilterChange(event: any) {
    this.selectedRange = event.target.value;
    this.reloadDashboard();
  }

  reloadDashboard() {
    if (!isPlatformBrowser(this.platformId)) return;

    this.http.get<any>(`http://localhost:8080/api/dashboard?range=${this.selectedRange}`)
      .subscribe({
        next: (data) => {
          this.completedThisWeek = data.completed;
          this.totalThisWeek = data.total;
          this.statusSummary = data.statusCounts;

          // destroy old charts (IMPORTANT FIX)
          Chart.getChart(this.statusChartRef?.nativeElement)?.destroy();
          Chart.getChart(this.trendChartRef?.nativeElement)?.destroy();
          Chart.getChart(this.typeChartRef?.nativeElement)?.destroy();

          setTimeout(() => this.loadCharts(data), 0);
        }
      });
  }
}
