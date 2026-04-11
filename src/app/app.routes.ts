import { Routes } from '@angular/router';
import { Login } from './component/login/login';
import { Dashboard } from './component/dashboard/dashboard';
import { Reports } from './component/reports/reports';
import { MapComponent } from './component/map/map';

export const routes: Routes = [
{ path: '', redirectTo: 'login', pathMatch: 'full' },
{ path: 'login', component: Login },
{ path: 'dashboard', component: Dashboard },

{ path: 'reports', redirectTo: 'reports/all', pathMatch: 'full' },

{ path: 'reports/:status', component: Reports },

{ path: 'map', component: MapComponent },

{ path: '**', redirectTo: 'login' }
];
