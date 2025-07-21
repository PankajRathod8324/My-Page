import { Component, OnInit, OnDestroy, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { HeaderComponent } from '../../components/header/header.component';
import { FooterComponent } from '../../components/footer/footer.component';
import { SidebarComponent } from '../../components/sidebar/sidebar.component';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-dashboard-layout',
  standalone: true,
  imports: [
    CommonModule,
    HeaderComponent,
    FooterComponent,
    SidebarComponent,
    RouterOutlet
  ],
  template: `
    <div class="dashboard-container">
      <app-header (sidebarToggle)="toggleSidebar()"></app-header>
      
      <div class="main-content">
        <app-sidebar 
          [opened]="sidebarOpened" 
          [mode]="sidebarMode"
          (openedChange)="onSidebarOpenedChange($event)">
          <div class="content-area">
            <router-outlet></router-outlet>
          </div>
        </app-sidebar>
      </div>
      
      <app-footer></app-footer>
    </div>
  `,
  styles: [`
    .dashboard-container {
      display: flex;
      flex-direction: column;
      height: 100vh;
      overflow: hidden;
    }
    
    .main-content {
      display: flex;
      flex: 1;
      overflow: hidden;
    }
    
    .content-area {
      flex: 1;
      overflow-y: auto;
      background-color: #fafafa;
    }
  `]
})
export class DashboardLayoutComponent implements OnInit, OnDestroy {
  sidebarOpened = true;
  sidebarMode: 'side' | 'over' | 'push' = 'side';
  
  private destroy$ = new Subject<void>();

  constructor(private breakpointObserver: BreakpointObserver) {}

  ngOnInit(): void {
    this.breakpointObserver
      .observe([Breakpoints.Handset])
      .pipe(takeUntil(this.destroy$))
      .subscribe(result => {
        if (result.matches) {
          this.sidebarMode = 'over';
          this.sidebarOpened = false;
        } else {
          this.sidebarMode = 'side';
          this.sidebarOpened = true;
        }
      });
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
  }

  toggleSidebar(): void {
    this.sidebarOpened = !this.sidebarOpened;
  }

  onSidebarOpenedChange(opened: boolean): void {
    this.sidebarOpened = opened;
  }
}