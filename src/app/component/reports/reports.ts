import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
selector: 'app-manage-report',
standalone: true,
imports: [CommonModule, FormsModule],
templateUrl: './reports.html',
styleUrl: './reports.css'
})
export class Reports {
showConfirmation = false;
reports = [
{ type: 'Pothole', photo: 'pothole.jpg', location: 'Changlun', date: '2026-01-05', status: 'Pending' },
{ type: 'Drainage',photo: 'drainage.jpg', location: 'Inasis Maybank', date: '2026-01-04', status: 'Approved' },
{ type: 'Poor Lighting', photo: 'lighting.jpg', location: 'Jalan UUM', date: '2026-01-03', status: 'In Progress' }
];
}
