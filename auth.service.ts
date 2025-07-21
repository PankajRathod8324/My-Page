import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, of } from 'rxjs';
import { User, LoginRequest, RegisterRequest } from '../models/user.model';
import { delay, map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private currentUserSubject = new BehaviorSubject<User | null>(null);
  public currentUser$ = this.currentUserSubject.asObservable();

  constructor() {
    // Check if user is stored in localStorage
    const storedUser = localStorage.getItem('currentUser');
    if (storedUser) {
      this.currentUserSubject.next(JSON.parse(storedUser));
    }
  }

  login(credentials: LoginRequest): Observable<User> {
    // Simulate API call
    return of({
      id: 1,
      email: credentials.email,
      firstName: 'John',
      lastName: 'Doe',
      role: 'admin'
    }).pipe(
      delay(1000),
      map(user => {
        localStorage.setItem('currentUser', JSON.stringify(user));
        this.currentUserSubject.next(user);
        return user;
      })
    );
  }

  register(userData: RegisterRequest): Observable<User> {
    // Simulate API call
    return of({
      id: 1,
      email: userData.email,
      firstName: userData.firstName,
      lastName: userData.lastName,
      role: 'user'
    }).pipe(
      delay(1000),
      map(user => {
        localStorage.setItem('currentUser', JSON.stringify(user));
        this.currentUserSubject.next(user);
        return user;
      })
    );
  }

  logout(): void {
    localStorage.removeItem('currentUser');
    this.currentUserSubject.next(null);
  }

  get currentUserValue(): User | null {
    return this.currentUserSubject.value;
  }

  get isAuthenticated(): boolean {
    return !!this.currentUserValue;
  }
}