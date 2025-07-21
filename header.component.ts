import { Component, Output, EventEmitter, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatMenuModule } from '@angular/material/menu';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { User } from '../../models/user.model';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [
    CommonModule,
    MatToolbarModule,
    MatButtonModule,
    MatIconModule,
    MatMenuModule
  ],
  template: `
    <mat-toolbar color="primary" class="header-toolbar">
      <button 
        mat-icon-button 
        (click)="toggleSidebar()" 
        class="sidebar-toggle"
        *ngIf="showSidebarToggle">
        <mat-icon>menu</mat-icon>
      </button>
      
      <span class="app-title">Angular Material App</span>
      
      <span class="spacer"></span>
      
      <div *ngIf="currentUser" class="user-menu">
        <button mat-button [matMenuTriggerFor]="userMenu" class="user-button">
          <mat-icon>account_circle</mat-icon>
          <span>{{ currentUser.firstName }} {{ currentUser.lastName }}</span>
          <mat-icon>expand_more</mat-icon>
        </button>
        
        <mat-menu #userMenu="matMenu">
          <button mat-menu-item>
            <mat-icon>person</mat-icon>
            <span>Profile</span>
          </button>
          <button mat-menu-item>
            <mat-icon>settings</mat-icon>
            <span>Settings</span>
          </button>
          <mat-divider></mat-divider>
          <button mat-menu-item (click)="logout()">
            <mat-icon>logout</mat-icon>
            <span>Logout</span>
          </button>
        </mat-menu>
      </div>
      
      <div *ngIf="!currentUser" class="auth-buttons">
        <button mat-button (click)="navigateToLogin()">Login</button>
        <button mat-raised-button color="accent" (click)="navigateToRegister()">Sign Up</button>
      </div>
    </mat-toolbar>
  `,
  styles: [`
    .header-toolbar {
      position: sticky;
      top: 0;
      z-index: 1000;
    }
    
    .spacer {
      flex: 1 1 auto;
    }
    
    .app-title {
      font-size: 1.25rem;
      font-weight: 500;
    }
    
    .user-button {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      color: white;
    }
    
    .auth-buttons {
      display: flex;
      gap: 1rem;
      align-items: center;
    }
    
    .auth-buttons button {
      color: white;
    }
    
    @media (max-width: 768px) {
      .sidebar-toggle {
        display: block !important;
      }
      
      .app-title {
        font-size: 1rem;
      }
      
      .user-button span {
        display: none;
      }
    }
  `]
})
export class HeaderComponent implements OnInit {
  @Output() sidebarToggle = new EventEmitter<void>();
  
  currentUser: User | null = null;
  showSidebarToggle = false;

  constructor(
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.authService.currentUser$.subscribe(user => {
      this.currentUser = user;
      this.showSidebarToggle = !!user; // Show sidebar toggle only when authenticated
    });
  }

  toggleSidebar(): void {
    this.sidebarToggle.emit();
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }

  navigateToLogin(): void {
    this.router.navigate(['/login']);
  }

  navigateToRegister(): void {
    this.router.navigate(['/register']);
  }
}