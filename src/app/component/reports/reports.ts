import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ReportService } from './report.service';
import { SafePipe } from '../safe.pipe';
import { ActivatedRoute } from '@angular/router';

@Component({
selector: 'app-manage-report',
standalone: true,
imports: [CommonModule, FormsModule, SafePipe],
templateUrl: './reports.html',
styleUrl: './reports.css'
})
export class Reports implements OnInit {

showConfirmation = false;
showModal = false;

filteredReports: any[] = [];

searchText: string = '';
selectedStatus: string = '';
selectedType: string = '';
selectedDate: string = '';

uniqueTypes: string[] = [];

// NEW: image preview
showImagePreview = false;
previewImage: string | null = null;

selectedReport: any = null;
reports: any[] = [];

currentPageStatus: string = '';
hideStatusFilter: boolean = false;

constructor(
  private reportService: ReportService,
  private route: ActivatedRoute
) {}

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      this.currentPageStatus = params['status']?.replace('-', ' ') || 'all';

      // hide status dropdown unless ALL page
      this.hideStatusFilter = this.currentPageStatus !== 'all';

      this.loadReports();
    });
  }

  loadReports() {
    const baseUrl = 'http://localhost/fmr/';
    this.reportService.getAllReports().subscribe({
      next: (data) => {
        this.reports = data.map(r => ({
          id: r.reportId,
          type: r.issueType,
          title: r.title,
          description: r.description,
          photo: this.getFirstAvailablePhoto(r, baseUrl),
          photo1: r.photo1 ? baseUrl + r.photo1 : null,
          photo2: r.photo2 ? baseUrl + r.photo2 : null,
          photo3: r.photo3 ? baseUrl + r.photo3 : null,
          location: r.locationText,
          latitude: r.latitude,
          longitude: r.longitude,
          mapUrl: r.latitude && r.longitude
            ? `https://www.google.com/maps?q=${r.latitude},${r.longitude}&hl=es;z=14&output=embed`
            : null,
          date: r.createdAt,
          status: r.status ? r.status.replace('_', ' ') : '',
          reporter: {
            name: r.user?.name,
            email: r.user?.email,
            phone: r.user?.phone
          }
        }));

        // ✅ EXTRACT UNIQUE TYPES
        this.uniqueTypes = [...new Set(this.reports.map(r => r.type))].filter(t => !!t);
        console.log('Unique Types Found:', this.uniqueTypes);

        this.applyFilters();

      },
      error: (err) => console.error(err)
    });
  }

  applyFilters() {
    this.filteredReports = this.reports.filter(report => {

      const matchesSearch =
        !this.searchText ||
        report.title?.toLowerCase().includes(this.searchText.toLowerCase()) ||
        report.description?.toLowerCase().includes(this.searchText.toLowerCase()) ||
        report.reporter?.name?.toLowerCase().includes(this.searchText.toLowerCase());

      const matchesType =
        !this.selectedType ||
        report.type === this.selectedType;

      const matchesDate =
        !this.selectedDate ||
        this.formatDate(report.date) === this.selectedDate;

      // ✅ NEW: PAGE STATUS FILTER
      const matchesPageStatus =
        this.currentPageStatus === 'all' ||
        report.status.toLowerCase() === this.currentPageStatus.toLowerCase();

      return matchesSearch && matchesType && matchesDate && matchesPageStatus;
    });
  }

  formatDate(date: any): string {
    const d = new Date(date);
    const year = d.getFullYear();
    const month = ('0' + (d.getMonth() + 1)).slice(-2);
    const day = ('0' + d.getDate()).slice(-2);
    return `${year}-${month}-${day}`; // matches input[type="date"]
  }

  getFirstAvailablePhoto(r: any, baseUrl: string): string | null {
    if (r.photo1) return baseUrl + r.photo1;
    if (r.photo2) return baseUrl + r.photo2;
    if (r.photo3) return baseUrl + r.photo3;
    return null;
  }

  getStatusClass(status: string): string {
    if (!status) return '';
    return status.toLowerCase().replace(/\s+/g, '-');
  }

  getTypeClass(type: string): string {
    if (!type) return 'type-default';
    return `type-${type.toLowerCase().replace(/\s+/g, '-')}`;
  }

  openReport(report: any) {
    this.selectedReport = { ...report };
    this.showModal = true;
  }

  closeModal() {
    this.showModal = false;
    this.selectedReport = null;
  }

  updateReport() {
    const payload = {
      status: this.selectedReport.status.toLowerCase().replace(' ', '_'),
      updatedBy: 1
    };

    this.reportService.updateReport(this.selectedReport.id, payload)
      .subscribe({
        next: () => {
          this.showModal = false;
          this.showConfirmation = true;
          this.loadReports();
          setTimeout(() => this.showConfirmation = false, 3000);
        },
        error: (err) => console.error(err)
      });
  }

  // ✅ NEW: Image Preview Functions
  openImagePreview(img: string) {
    this.previewImage = img;
    this.showImagePreview = true;
  }

  closeImagePreview() {
    this.showImagePreview = false;
    this.previewImage = null;
  }

  clearFilters() {
    this.searchText = '';
    this.selectedStatus = '';
    this.selectedType = '';
    this.selectedDate = '';

    this.filteredReports = [...this.reports];
  }

  getPageTitle(): string {
    if (this.currentPageStatus === 'all') return 'Manage Reports';
    return `${this.currentPageStatus.toUpperCase()} Reports`;
  }
}
