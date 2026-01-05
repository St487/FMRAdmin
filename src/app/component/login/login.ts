import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
selector: 'app-login',
standalone: true,
imports: [FormsModule, CommonModule],
templateUrl: './login.html',
styleUrl: './login.css',
})
export class Login {
private readonly MOCK_USER = '299430';
private readonly MOCK_PASS = '123456';

userId = '';
password = '';
showError = false;

constructor(private router: Router) {}

  onLogin() {
    if (this.userId === this.MOCK_USER && this.password === this.MOCK_PASS) {
      this.showError = false;
      this.router.navigate(['/dashboard']);
    } else {
      this.showError = true;
    }
  }
}
