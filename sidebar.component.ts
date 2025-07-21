import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatListModule } from '@angular/material/list';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [
    CommonModule,
    MatSidenavModule,
    MatListModule,
    MatIconModule,
    MatButtonModule,
    RouterModule
  ],
  template: `
    <mat-sidenav-container class="sidenav-container">
      <mat-sidenav 
        #drawer 
        [mode]="mode" 
        [opened]="opened" 
        (openedChange)="openedChange.emit($event)"
        class="sidenav">
        
        <div class="sidenav-header">
          <h3>Navigation</h3>
        </div>
        
        <mat-nav-list>
          <a mat-list-item routerLink="/dashboard" routerLinkActive="active-link" (click)="closeOnMobile()">
            <mat-icon matListItemIcon>dashboard</mat-icon>
            <span matListItemTitle>Dashboard</span>
          </a>
          
          <a mat-list-item routerLink="/profile" routerLinkActive="active-link" (click)="closeOnMobile()">
            <mat-icon matListItemIcon>person</mat-icon>
            <span matListItemTitle>Profile</span>
          </a>
          
          <a mat-list-item routerLink="/analytics" routerLinkActive="active-link" (click)="closeOnMobile()">
            <mat-icon matListItemIcon>analytics</mat-icon>
            <span matListItemTitle>Analytics</span>
          </a>
          
          <a mat-list-item routerLink="/settings" routerLinkActive="active-link" (click)="closeOnMobile()">
            <mat-icon matListItemIcon>settings</mat-icon>
            <span matListItemTitle>Settings</span>
          </a>
          
          <a mat-list-item routerLink="/reports" routerLinkActive="active-link" (click)="closeOnMobile()">
            <mat-icon matListItemIcon>assessment</mat-icon>
            <span matListItemTitle>Reports</span>
          </a>
          
          <a mat-list-item routerLink="/help" routerLinkActive="active-link" (click)="closeOnMobile()">
            <mat-icon matListItemIcon>help</mat-icon>
            <span matListItemTitle>Help</span>
          </a>
        </mat-nav-list>
      </mat-sidenav>
      
      <mat-sidenav-content>
        <ng-content></ng-content>
      </mat-sidenav-content>
    </mat-sidenav-container>
  `,
  styles: [`
    .sidenav-container {
      height: 100%;
    }
    
    .sidenav {
      width: 250px;
      background-color: #fafafa;
      border-right: 1px solid #e0e0e0;
    }
    
    .sidenav-header {
      padding: 1rem;
      background-color: #f5f5f5;
      border-bottom: 1px solid #e0e0e0;
    }
    
    .sidenav-header h3 {
      margin: 0;
      color: #424242;
      font-weight: 500;
    }
    
    .active-link {
      background-color: #e3f2fd !important;
      color: #1976d2 !important;
    }
    
    .active-link mat-icon {
      color: #1976d2 !important;
    }
    
    mat-list-item {
      margin-bottom: 4px;
      border-radius: 4px;
      margin-left: 8px;
      margin-right: 8px;
    }
    
    mat-list-item:hover {
      background-color: #f5f5f5;
    }
  `]
})
export class SidebarComponent {
  @Input() opened = true;
  @Input() mode: 'side' | 'over' | 'push' = 'side';
  @Output() openedChange = new EventEmitter<boolean>();

  closeOnMobile(): void {
    if (this.mode === 'over') {
      this.openedChange.emit(false);
    }
  }
}