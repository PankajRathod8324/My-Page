import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatGridListModule } from '@angular/material/grid-list';
import { AuthService } from '../../services/auth.service';
import { User } from '../../models/user.model';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [
    CommonModule,
    MatCardModule,
    MatIconModule,
    MatButtonModule,
    MatGridListModule
  ],
  template: `
    <div class="dashboard-content">
      <div class="welcome-section">
        <h1>Welcome back, {{ currentUser?.firstName }}!</h1>
        <p>Here's what's happening with your account today.</p>
      </div>
      
      <div class="stats-grid">
        <mat-card class="stat-card">
          <mat-card-content>
            <div class="stat-content">
              <div class="stat-icon primary">
                <mat-icon>people</mat-icon>
              </div>
              <div class="stat-info">
                <h3>1,234</h3>
                <p>Total Users</p>
                <span class="stat-change positive">+12%</span>
              </div>
            </div>
          </mat-card-content>
        </mat-card>
        
        <mat-card class="stat-card">
          <mat-card-content>
            <div class="stat-content">
              <div class="stat-icon success">
                <mat-icon>trending_up</mat-icon>
              </div>
              <div class="stat-info">
                <h3>$45,678</h3>
                <p>Revenue</p>
                <span class="stat-change positive">+8%</span>
              </div>
            </div>
          </mat-card-content>
        </mat-card>
        
        <mat-card class="stat-card">
          <mat-card-content>
            <div class="stat-content">
              <div class="stat-icon warning">
                <mat-icon>shopping_cart</mat-icon>
              </div>
              <div class="stat-info">
                <h3>567</h3>
                <p>Orders</p>
                <span class="stat-change negative">-3%</span>
              </div>
            </div>
          </mat-card-content>
        </mat-card>
        
        <mat-card class="stat-card">
          <mat-card-content>
            <div class="stat-content">
              <div class="stat-icon accent">
                <mat-icon>assessment</mat-icon>
              </div>
              <div class="stat-info">
                <h3>98.5%</h3>
                <p>Performance</p>
                <span class="stat-change positive">+2%</span>
              </div>
            </div>
          </mat-card-content>
        </mat-card>
      </div>
      
      <div class="dashboard-grid">
        <mat-card class="dashboard-card">
          <mat-card-header>
            <mat-card-title>Recent Activity</mat-card-title>
            <mat-card-subtitle>Latest updates and notifications</mat-card-subtitle>
          </mat-card-header>
          <mat-card-content>
            <div class="activity-list">
              <div class="activity-item">
                <mat-icon class="activity-icon">notifications</mat-icon>
                <div class="activity-content">
                  <p>New user registered</p>
                  <small>2 minutes ago</small>
                </div>
              </div>
              <div class="activity-item">
                <mat-icon class="activity-icon">shopping_cart</mat-icon>
                <div class="activity-content">
                  <p>Order #1234 completed</p>
                  <small>15 minutes ago</small>
                </div>
              </div>
              <div class="activity-item">
                <mat-icon class="activity-icon">email</mat-icon>
                <div class="activity-content">
                  <p>New message received</p>
                  <small>1 hour ago</small>
                </div>
              </div>
            </div>
          </mat-card-content>
        </mat-card>
        
        <mat-card class="dashboard-card">
          <mat-card-header>
            <mat-card-title>Quick Actions</mat-card-title>
            <mat-card-subtitle>Common tasks and shortcuts</mat-card-subtitle>
          </mat-card-header>
          <mat-card-content>
            <div class="action-buttons">
              <button mat-raised-button color="primary" class="action-button">
                <mat-icon>add</mat-icon>
                Create New
              </button>
              <button mat-raised-button color="accent" class="action-button">
                <mat-icon>upload</mat-icon>
                Upload File
              </button>
              <button mat-raised-button class="action-button">
                <mat-icon>settings</mat-icon>
                Settings
              </button>
              <button mat-raised-button class="action-button">
                <mat-icon>help</mat-icon>
                Get Help
              </button>
            </div>
          </mat-card-content>
        </mat-card>
      </div>
    </div>
  `,
  styles: [`
    .dashboard-content {
      padding: 2rem;
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .welcome-section {
      margin-bottom: 2rem;
    }
    
    .welcome-section h1 {
      font-size: 2rem;
      font-weight: 500;
      color: #333;
      margin-bottom: 0.5rem;
    }
    
    .welcome-section p {
      color: #666;
      font-size: 1.1rem;
    }
    
    .stats-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 1rem;
      margin-bottom: 2rem;
    }
    
    .stat-card {
      padding: 0;
    }
    
    .stat-content {
      display: flex;
      align-items: center;
      gap: 1rem;
    }
    
    .stat-icon {
      width: 60px;
      height: 60px;
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
    }
    
    .stat-icon.primary {
      background-color: #1976d2;
    }
    
    .stat-icon.success {
      background-color: #4caf50;
    }
    
    .stat-icon.warning {
      background-color: #ff9800;
    }
    
    .stat-icon.accent {
      background-color: #9c27b0;
    }
    
    .stat-info h3 {
      font-size: 1.75rem;
      font-weight: 600;
      margin: 0;
      color: #333;
    }
    
    .stat-info p {
      color: #666;
      margin: 0.25rem 0;
    }
    
    .stat-change {
      font-size: 0.875rem;
      font-weight: 500;
    }
    
    .stat-change.positive {
      color: #4caf50;
    }
    
    .stat-change.negative {
      color: #f44336;
    }
    
    .dashboard-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
      gap: 2rem;
    }
    
    .dashboard-card {
      height: fit-content;
    }
    
    .activity-list {
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }
    
    .activity-item {
      display: flex;
      align-items: center;
      gap: 1rem;
      padding: 0.75rem;
      border-radius: 8px;
      background-color: #f5f5f5;
    }
    
    .activity-icon {
      color: #1976d2;
    }
    
    .activity-content p {
      margin: 0;
      font-weight: 500;
    }
    
    .activity-content small {
      color: #666;
    }
    
    .action-buttons {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
      gap: 1rem;
    }
    
    .action-button {
      height: 48px;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
    }
    
    @media (max-width: 768px) {
      .dashboard-content {
        padding: 1rem;
      }
      
      .stats-grid {
        grid-template-columns: 1fr;
      }
      
      .dashboard-grid {
        grid-template-columns: 1fr;
        gap: 1rem;
      }
      
      .welcome-section h1 {
        font-size: 1.5rem;
      }
    }
  `]
})
export class DashboardComponent implements OnInit {
  currentUser: User | null = null;

  constructor(private authService: AuthService) {}

  ngOnInit(): void {
    this.authService.currentUser$.subscribe(user => {
      this.currentUser = user;
    });
  }
}