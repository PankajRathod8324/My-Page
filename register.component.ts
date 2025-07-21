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
  selector: 'app-register',
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
            <mat-card-title class="auth-title">Create Account</mat-card-title>
            <mat-card-subtitle>Sign up to get started</mat-card-subtitle>
          </mat-card-header>
          
          <mat-card-content>
            <form [formGroup]="registerForm" (ngSubmit)="onSubmit()" class="auth-form">
              <div class="name-row">
                <mat-form-field appearance="outline" class="name-field">
                  <mat-label>First Name</mat-label>
                  <input 
                    matInput 
                    formControlName="firstName" 
                    placeholder="First name">
                  <mat-error *ngIf="registerForm.get('firstName')?.hasError('required')">
                    First name is required
                  </mat-error>
                </mat-form-field>
                
                <mat-form-field appearance="outline" class="name-field">
                  <mat-label>Last Name</mat-label>
                  <input 
                    matInput 
                    formControlName="lastName" 
                    placeholder="Last name">
                  <mat-error *ngIf="registerForm.get('lastName')?.hasError('required')">
                    Last name is required
                  </mat-error>
                </mat-form-field>
              </div>
              
              <mat-form-field appearance="outline" class="full-width">
                <mat-label>Email</mat-label>
                <input 
                  matInput 
                  formControlName="email" 
                  type="email" 
                  placeholder="Enter your email">
                <mat-icon matSuffix>email</mat-icon>
                <mat-error *ngIf="registerForm.get('email')?.hasError('required')">
                  Email is required
                </mat-error>
                <mat-error *ngIf="registerForm.get('email')?.hasError('email')">
                  Please enter a valid email
                </mat-error>
              </mat-form-field>
              
              <mat-form-field appearance="outline" class="full-width">
                <mat-label>Password</mat-label>
                <input 
                  matInput 
                  formControlName="password" 
                  [type]="hidePassword ? 'password' : 'text'" 
                  placeholder="Create a password">
                <button 
                  mat-icon-button 
                  matSuffix 
                  type="button"
                  (click)="hidePassword = !hidePassword">
                  <mat-icon>{{hidePassword ? 'visibility_off' : 'visibility'}}</mat-icon>
                </button>
                <mat-error *ngIf="registerForm.get('password')?.hasError('required')">
                  Password is required
                </mat-error>
                <mat-error *ngIf="registerForm.get('password')?.hasError('minlength')">
                  Password must be at least 6 characters
                </mat-error>
              </mat-form-field>
              
              <mat-form-field appearance="outline" class="full-width">
                <mat-label>Confirm Password</mat-label>
                <input 
                  matInput 
                  formControlName="confirmPassword" 
                  [type]="hideConfirmPassword ? 'password' : 'text'" 
                  placeholder="Confirm your password">
                <button 
                  mat-icon-button 
                  matSuffix 
                  type="button"
                  (click)="hideConfirmPassword = !hideConfirmPassword">
                  <mat-icon>{{hideConfirmPassword ? 'visibility_off' : 'visibility'}}</mat-icon>
                </button>
                <mat-error *ngIf="registerForm.get('confirmPassword')?.hasError('required')">
                  Please confirm your password
                </mat-error>
                <mat-error *ngIf="registerForm.get('confirmPassword')?.hasError('passwordMismatch')">
                  Passwords do not match
                </mat-error>
              </mat-form-field>
              
              <button 
                mat-raised-button 
                color="primary" 
                type="submit" 
                class="submit-button full-width"
                [disabled]="registerForm.invalid || isLoading">
                <mat-spinner diameter="20" *ngIf="isLoading"></mat-spinner>
                <span *ngIf="!isLoading">Create Account</span>
                <span *ngIf="isLoading">Creating Account...</span>
              </button>
            </form>
            
            <div class="auth-links">
              <p>Already have an account? 
                <a routerLink="/login" class="auth-link">Sign in here</a>
              </p>
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
    
    .name-row {
      display: flex;
      gap: 1rem;
    }
    
    .name-field {
      flex: 1;
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
    
    @media (max-width: 600px) {
      .name-row {
        flex-direction: column;
        gap: 1rem;
      }
    }
  `]
})
export class RegisterComponent implements OnInit {
  registerForm!: FormGroup;
  hidePassword = true;
  hideConfirmPassword = true;
  isLoading = false;

  constructor(
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private router: Router,
    private snackBar: MatSnackBar
  ) {}

  ngOnInit(): void {
    this.registerForm = this.formBuilder.group({
      firstName: ['', [Validators.required]],
      lastName: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', [Validators.required]]
    }, { validators: this.passwordMatchValidator });

    // Redirect if already authenticated
    if (this.authService.isAuthenticated) {
      this.router.navigate(['/dashboard']);
    }
  }

  passwordMatchValidator(form: FormGroup) {
    const password = form.get('password');
    const confirmPassword = form.get('confirmPassword');
    
    if (password && confirmPassword && password.value !== confirmPassword.value) {
      confirmPassword.setErrors({ passwordMismatch: true });
      return { passwordMismatch: true };
    }
    
    return null;
  }

  onSubmit(): void {
    if (this.registerForm.valid) {
      this.isLoading = true;
      
      this.authService.register(this.registerForm.value).subscribe({
        next: (user) => {
          this.isLoading = false;
          this.snackBar.open('Account created successfully!', 'Close', {
            duration: 3000,
            horizontalPosition: 'end',
            verticalPosition: 'top'
          });
          this.router.navigate(['/dashboard']);
        },
        error: (error) => {
          this.isLoading = false;
          this.snackBar.open('Registration failed. Please try again.', 'Close', {
            duration: 3000,
            horizontalPosition: 'end',
            verticalPosition: 'top'
          });
        }
      });
    }
  }
}