import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class ReportService {

private baseUrl = 'https://fmr-admin-backend.onrender.com/api/reports';

constructor(private http: HttpClient) {}

  getAllReports(): Observable<any[]> {
    return this.http.get<any[]>(this.baseUrl);
  }

  getReportById(id: number): Observable<any> {
    return this.http.get<any>(`${this.baseUrl}/${id}`);
  }

  updateReport(id: number, payload: any): Observable<any> {
    return this.http.put<any>(`${this.baseUrl}/${id}`, payload);
  }
}
