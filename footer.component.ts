import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';

@Component({
  selector: 'app-footer',
  standalone: true,
  imports: [CommonModule, MatToolbarModule, MatIconModule, MatButtonModule],
  template: `
    <footer class="footer">
      <div class="footer-content">
        <div class="footer-section">
          <h4>Angular Material App</h4>
          <p>Built with Angular and Material Design</p>
        </div>
        
        <div class="footer-section">
          <h4>Quick Links</h4>
          <ul>
            <li><a href="#" class="footer-link">About</a></li>
            <li><a href="#" class="footer-link">Contact</a></li>
            <li><a href="#" class="footer-link">Privacy</a></li>
            <li><a href="#" class="footer-link">Terms</a></li>
          </ul>
        </div>
        
        <div class="footer-section">
          <h4>Follow Us</h4>
          <div class="social-links">
            <button mat-icon-button class="social-button">
              <mat-icon>facebook</mat-icon>
            </button>
            <button mat-icon-button class="social-button">
              <mat-icon>twitter</mat-icon>
            </button>
            <button mat-icon-button class="social-button">
              <mat-icon>linkedin</mat-icon>
            </button>
          </div>
        </div>
      </div>
      
      <div class="footer-bottom">
        <p>&copy; 2025 Angular Material App. All rights reserved.</p>
      </div>
    </footer>
  `,
  styles: [`
    .footer {
      background-color: #424242;
      color: white;
      margin-top: auto;
    }
    
    .footer-content {
      display: flex;
      justify-content: space-around;
      padding: 2rem 1rem;
      max-width: 1200px;
      margin: 0 auto;
      flex-wrap: wrap;
      gap: 2rem;
    }
    
    .footer-section {
      flex: 1;
      min-width: 200px;
    }
    
    .footer-section h4 {
      margin-bottom: 1rem;
      color: #fff;
      font-weight: 500;
    }
    
    .footer-section ul {
      list-style: none;
      padding: 0;
    }
    
    .footer-section li {
      margin-bottom: 0.5rem;
    }
    
    .footer-link {
      color: #ccc;
      text-decoration: none;
      transition: color 0.3s ease;
    }
    
    .footer-link:hover {
      color: #fff;
    }
    
    .social-links {
      display: flex;
      gap: 0.5rem;
    }
    
    .social-button {
      color: #ccc;
      transition: color 0.3s ease;
    }
    
    .social-button:hover {
      color: #fff;
    }
    
    .footer-bottom {
      background-color: #303030;
      text-align: center;
      padding: 1rem;
      border-top: 1px solid #555;
    }
    
    .footer-bottom p {
      margin: 0;
      color: #ccc;
      font-size: 0.875rem;
    }
    
    @media (max-width: 768px) {
      .footer-content {
        flex-direction: column;
        text-align: center;
      }
      
      .footer-section {
        margin-bottom: 1rem;
      }
    }
  `]
})
export class FooterComponent {}