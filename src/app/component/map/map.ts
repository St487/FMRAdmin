import { Component, AfterViewInit, Inject, PLATFORM_ID } from '@angular/core';
import { isPlatformBrowser } from '@angular/common';
import { ReportService } from '../reports/report.service';

let L: any;

@Component({
selector: 'app-map',
templateUrl: './map.html',
styleUrls: ['./map.css']
})
export class MapComponent implements AfterViewInit {

private map: any;
reports: any[] = [];

constructor(
    private reportService: ReportService,
    @Inject(PLATFORM_ID) private platformId: object
  ) {}

  async ngAfterViewInit() {

    if (!isPlatformBrowser(this.platformId)) return;

    const leaflet = await import('leaflet');
    L = leaflet.default;

    // fix icons
    delete L.Icon.Default.prototype._getIconUrl;

    L.Icon.Default.mergeOptions({
      iconRetinaUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png',
      iconUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png',
      shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
    });

    this.initMap();
    this.loadReports();
  }

  initMap(): void {
    this.map = L.map('map').setView([4.2105, 101.9758], 7);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; OpenStreetMap contributors'
    }).addTo(this.map);
  }

  loadReports(): void {
    this.reportService.getAllReports().subscribe(data => {
      this.reports = data;
      this.addMarkers();
    });
  }

  addMarkers(): void {
    this.reports.forEach(r => {
      if (!r.latitude || !r.longitude) return;

      L.marker([+r.latitude, +r.longitude]) // ✅ ensure number
        .addTo(this.map)
        .bindPopup(`<b>${r.title}</b><br>${r.status}`);
    });
  }
}
