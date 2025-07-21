import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule, MatCardModule, MatButtonModule, MatIconModule],
  template: `
    <div class="content-area">
      <h1>Profile</h1>
      <mat-card>
        <mat-card-content>
          <p>This is the profile page. Add your profile management features here.</p>
        </mat-card-content>
      </mat-card>
    </div>
  `,
  styles: [`
    .content-area {
      padding: 2rem;
    }
  `]
})
export class ProfileComponent {}