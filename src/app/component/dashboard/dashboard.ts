import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';

@Component({
selector: 'app-dashboard',
standalone: true,
imports: [CommonModule],
templateUrl: './dashboard.html',
styleUrl: './dashboard.css'
})
export class Dashboard {
// Data must match the HTML template fields
recentReports = [
{ type: 'Drainage', title: 'Drainage at inasis UUM', photo: 'drainage1.jpg', date: '2026-01-04', status: 'Approved' },
{ type: 'Pothole', title: 'A large pothole beside the KFC store', photo: 'pothole.jpg', date: '2026-01-05', status: 'Pending' },
{ type: 'Poor Lighting', title: 'Lighting not function', photo: 'light.jpg', date: '2026-01-03', status: 'In Progress' },
{ type: 'Poor Lighting', title: 'Broken', photo: 'light1.jpg', date: '2026-01-03', status: 'Completed' },
];

constructor(private router: Router) {}

  filterReports(status: string) {
    console.log('Filtering reports by:', status);
  }

  viewDetails(title: string) {
    alert('Viewing details for: ' + title);
  }

  logout() {
    this.router.navigate(['/login']);
  }
}
