import { Component } from '@angular/core';
import { Router, RouterOutlet, RouterLink, RouterLinkActive } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
selector: 'app-root',
standalone: true,
imports: [RouterOutlet, RouterLink, RouterLinkActive, CommonModule],
templateUrl: './app.html',
styleUrl: './app.css'
})
export class App {
constructor(private router: Router) {}

  // Determines visibility of the navbar
  shouldShowNavbar(): boolean {
    // Hide navbar if the current path is /login
    return this.router.url !== '/login';
  }

  logout() {
    // Navigate to login (Clearing any stored user data can be added here)
    this.router.navigate(['/login']);
  }
}
