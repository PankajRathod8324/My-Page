import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatSnackBarModule, MatSnackBar } from '@angular/material/snack-bar';
import { Router, RouterModule } from '@angular/router';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatIconModule,
    MatProgressSpinnerModule,
    MatSnackBarModule,
    RouterModule
  ],
  template: `
    <div class="center-content">
      <div class="auth-container">
        <mat-card class="auth-card">
          <mat-card-header>
            <mat-card-title class="auth-title">Welcome Back</mat-card-title>
            <mat-card-subtitle>Sign in to your account</mat-card-subtitle>
          </mat-card-header>
          
          <mat-card-content>
            <form [formGroup]="loginForm" (ngSubmit)="onSubmit()" class="auth-form">
              <mat-form-field appearance="outline" class="full-width">
                <mat-label>Email</mat-label>
                <input 
                  matInput 
                  formControlName="email" 
                  type="email" 
                  placeholder="Enter your email">
                <mat-icon matSuffix>email</mat-icon>
                <mat-error *ngIf="loginForm.get('email')?.hasError('required')">
                  Email is required
                </mat-error>
                <mat-error *ngIf="loginForm.get('email')?.hasError('email')">
                  Please enter a valid email
                </mat-error>
              </mat-form-field>
              
              <mat-form-field appearance="outline" class="full-width">
                <mat-label>Password</mat-label>
                <input 
                  matInput 
                  formControlName="password" 
                  [type]="hidePassword ? 'password' : 'text'" 
                  placeholder="Enter your password">
                <button 
                  mat-icon-button 
                  matSuffix 
                  type="button"
                  (click)="hidePassword = !hidePassword">
                  <mat-icon>{{hidePassword ? 'visibility_off' : 'visibility'}}</mat-icon>
                </button>
                <mat-error *ngIf="loginForm.get('password')?.hasError('required')">
                  Password is required
                </mat-error>
                <mat-error *ngIf="loginForm.get('password')?.hasError('minlength')">
                  Password must be at least 6 characters
                </mat-error>
              </mat-form-field>
              
              <button 
                mat-raised-button 
                color="primary" 
                type="submit" 
                class="submit-button full-width"
                [disabled]="loginForm.invalid || isLoading">
                <mat-spinner diameter="20" *ngIf="isLoading"></mat-spinner>
                <span *ngIf="!isLoading">Sign In</span>
                <span *ngIf="isLoading">Signing In...</span>
              </button>
            </form>
            
            <div class="auth-links">
              <p>Don't have an account? 
                <a routerLink="/register" class="auth-link">Sign up here</a>
              </p>
              <a href="#" class="forgot-password">Forgot Password?</a>
            </div>
          </mat-card-content>
        </mat-card>
      </div>
    </div>
  `,
  styles: [`
    .auth-card {
      padding: 2rem;
      box-shadow: 0 8px 24px rgba(0,0,0,0.12);
      border-radius: 12px;
    }
    
    .auth-title {
      text-align: center;
      font-size: 1.75rem;
      font-weight: 500;
      color: #1976d2;
      margin-bottom: 0.5rem;
    }
    
    mat-card-subtitle {
      text-align: center;
      color: #666;
      margin-bottom: 2rem;
    }
    
    .auth-form {
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }
    
    .full-width {
      width: 100%;
    }
    
    .submit-button {
      height: 48px;
      font-size: 1rem;
      font-weight: 500;
      margin-top: 1rem;
    }
    
    .auth-links {
      margin-top: 2rem;
      text-align: center;
    }
    
    .auth-links p {
      margin: 1rem 0;
      color: #666;
    }
    
    .auth-link {
      color: #1976d2;
      text-decoration: none;
      font-weight: 500;
    }
    
    .auth-link:hover {
      text-decoration: underline;
    }
    
    .forgot-password {
      color: #666;
      text-decoration: none;
      font-size: 0.875rem;
    }
    
    .forgot-password:hover {
      color: #1976d2;
      text-decoration: underline;
    }
  `]
})
export class LoginComponent implements OnInit {
  loginForm!: FormGroup;
  hidePassword = true;
  isLoading = false;

  constructor(
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private router: Router,
    private snackBar: MatSnackBar
  ) {}

  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });

    // Redirect if already authenticated
    if (this.authService.isAuthenticated) {
      this.router.navigate(['/dashboard']);
    }
  }

  onSubmit(): void {
    if (this.loginForm.valid) {
      this.isLoading = true;
      
      this.authService.login(this.loginForm.value).subscribe({
        next: (user) => {
          this.isLoading = false;
          this.snackBar.open('Login successful!', 'Close', {
            duration: 3000,
            horizontalPosition: 'end',
            verticalPosition: 'top'
          });
          this.router.navigate(['/dashboard']);
        },
        error: (error) => {
          this.isLoading = false;
          this.snackBar.open('Login failed. Please try again.', 'Close', {
            duration: 3000,
            horizontalPosition: 'end',
            verticalPosition: 'top'
          });
        }
      });
    }
  }
}