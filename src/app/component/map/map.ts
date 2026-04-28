import { Component, AfterViewInit, Inject, PLATFORM_ID } from '@angular/core';
import { isPlatformBrowser, CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ReportService } from '../reports/report.service';
import { SafePipe } from '../safe.pipe';

let L: any;

@Component({
selector: 'app-map',
standalone: true,
templateUrl: './map.html',
styleUrls: ['./map.css'],
imports: [CommonModule, FormsModule, SafePipe]
})
export class MapComponent implements AfterViewInit {

private map: any;

reports: any[] = [];
selectedReport: any = null;

showModal = false;
showConfirmation = false;

previewImage: string | null = null;

rejectionReasons: string[] = [
'Duplicate Report',
'Invalid Information',
'Spam Report',
'Out of Scope',
'Insufficient Evidence'
];

selectedRejectionReason: string = '';

constructor(
    private reportService: ReportService,
    @Inject(PLATFORM_ID) private platformId: object
  ) {}

  async ngAfterViewInit() {
    if (!isPlatformBrowser(this.platformId)) return;

    const leaflet = await import('leaflet');
    L = leaflet.default;

    delete L.Icon.Default.prototype._getIconUrl;

    L.Icon.Default.mergeOptions({
      iconRetinaUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png',
      iconUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png',
      shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
    });

    setTimeout(() => {
      this.initMap();
      this.loadReports();
    }, 100);
  }

  initMap() {
    this.map = L.map('map').setView([4.2105, 101.9758], 7);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; OpenStreetMap contributors'
    }).addTo(this.map);
  }

  loadReports() {
    const baseUrl = 'http://localhost/fmr/';

    this.reportService.getAllReports().subscribe(data => {
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
          ? `https://www.google.com/maps?q=${r.latitude},${r.longitude}&output=embed`
          : null,
        date: r.createdAt,
        status: r.status ? r.status.replace('_', ' ') : '',
        rejectionReason: r.rejectionReason || '',
        reporter: {
          name: r.user?.name,
          email: r.user?.email,
          phone: r.user?.phone
        }
      }));

      this.addMarkers();
    });
  }

  addMarkers() {
    this.reports.forEach(r => {
      if (!r.latitude || !r.longitude) return;

      const marker = L.marker([+r.latitude, +r.longitude]).addTo(this.map);

      marker.on('click', () => this.openReport(r));
    });
  }

  openReport(report: any) {
    this.selectedReport = { ...report };
    this.selectedRejectionReason = report.rejectionReason || '';
    this.showModal = true;
  }

  closeModal() {
    this.showModal = false;
    this.selectedReport = null;
  }

  updateReport() {

    if (this.selectedReport.status === 'rejected' && !this.selectedRejectionReason) {
      alert('Please select a rejection reason');
      return;
    }

    const payload = {
      status: this.selectedReport.status.toLowerCase().replace(' ', '_'),
      updatedBy: 1,
      rejectionReason: this.selectedReport.status === 'rejected'
        ? this.selectedRejectionReason
        : null
    };

    this.reportService.updateReport(this.selectedReport.id, payload)
      .subscribe(() => {
        this.showModal = false;
        this.showConfirmation = true;
        this.loadReports();
        setTimeout(() => this.showConfirmation = false, 3000);
      });
  }

  getFirstAvailablePhoto(r: any, baseUrl: string) {
    if (r.photo1) return baseUrl + r.photo1;
    if (r.photo2) return baseUrl + r.photo2;
    if (r.photo3) return baseUrl + r.photo3;
    return null;
  }

  openImagePreview(img: string) {
    this.previewImage = img;
  }

  closeImagePreview() {
    this.previewImage = null;
  }
}
