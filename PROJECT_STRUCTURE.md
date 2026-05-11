# QuickBook Project Structure

This document outlines the complete project structure for the QuickBook booking application.

## Project Structure Overview

### Root Level Files
- `pubspec.yaml` - Flutter dependencies and configuration
- `analysis_options.yaml` - Dart analysis configuration
- `README.md` - Project documentation

### Platform-Specific Folders
- `android/` - Android platform configuration
- `ios/` - iOS platform configuration
- `web/` - Web platform configuration
- `windows/` - Windows desktop configuration
- `linux/` - Linux desktop configuration
- `macos/` - macOS platform configuration

### Assets Folder
```
assets/
├── animations/       # Lottie animations
├── icons/           # SVG icons
├── images/          # PNG/JPG images
└── fonts/           # Custom fonts (Poppins)
```

### Core Folder Structure
```
lib/core/
├── constants/
│   ├── app_colors.dart      # Color definitions
│   ├── app_strings.dart     # String constants
│   └── app_sizes.dart       # Size/spacing constants
├── theme/
│   └── app_theme.dart       # Light and dark themes
├── utils/
│   ├── validators.dart      # Form validators
│   ├── helpers.dart         # Utility helpers
│   └── extensions.dart      # Dart extensions
└── services/
    ├── api_service.dart             # HTTP client
    ├── storage_service.dart         # Local storage
    └── notification_service.dart    # Push notifications
```

### Models
```
lib/models/
├── user_model.dart          # User data model
├── booking_model.dart       # Booking data model
├── service_model.dart       # Service data model
├── category_model.dart      # Category data model
└── notification_model.dart  # Notification data model
```

### Providers (State Management)
```
lib/providers/
├── auth_provider.dart       # Authentication state
├── booking_provider.dart    # Bookings state
├── service_provider.dart    # Services state
├── user_provider.dart       # User profile state
└── theme_provider.dart      # Theme state
```

### Routes
```
lib/routes/
└── app_routes.dart          # GoRouter configuration
```

### Screens
```
lib/screens/
├── splash/
│   └── splash_screen.dart
├── onboarding/
│   └── onboarding_screen.dart
├── auth/
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── forgot_password_screen.dart
│   └── otp_screen.dart
├── navigation/
│   └── main_navigation.dart
├── home/
│   ├── home_screen.dart
│   └── widgets/
│       ├── hero_banner.dart
│       ├── category_section.dart
│       ├── featured_services.dart
│       ├── nearby_services.dart
│       ├── trending_section.dart
│       └── booking_card.dart
├── search/
│   ├── search_screen.dart
│   ├── filter_screen.dart
│   └── search_result_screen.dart
├── booking/
│   ├── booking_screen.dart
│   ├── booking_details_screen.dart
│   ├── payment_screen.dart
│   └── success_screen.dart
├── calendar/
│   ├── calendar_screen.dart
│   └── appointment_screen.dart
├── profile/
│   ├── profile_screen.dart
│   ├── edit_profile_screen.dart
│   ├── favorites_screen.dart
│   ├── booking_history_screen.dart
│   └── settings_screen.dart
├── notifications/
│   └── notification_screen.dart
├── business/
│   ├── dashboard_screen.dart
│   ├── analytics_screen.dart
│   ├── manage_booking_screen.dart
│   ├── add_service_screen.dart
│   └── revenue_screen.dart
└── admin/
    ├── admin_dashboard.dart
    ├── user_management.dart
    └── service_management.dart
```

### Widgets (Reusable Components)
```
lib/widgets/
├── custom_button.dart
├── custom_textfield.dart
├── glass_card.dart
├── service_card.dart
├── category_card.dart
├── custom_appbar.dart
├── custom_navbar.dart
├── loading_widget.dart
└── empty_widget.dart
```

### API Clients
```
lib/api/
├── auth_api.dart            # Authentication API
├── booking_api.dart         # Bookings API
├── service_api.dart         # Services API
└── user_api.dart            # User API
```

### Backend Structure
```
backend/
├── server.js                # Express server entry point
├── package.json             # Node dependencies
├── config/
│   └── db.js               # Database configuration
├── controllers/
│   ├── authController.js    # Auth logic
│   ├── bookingController.js # Booking logic
│   ├── serviceController.js # Service logic
│   └── userController.js    # User logic
├── middleware/
│   ├── authMiddleware.js    # JWT authentication
│   └── errorMiddleware.js   # Error handling
├── models/
│   ├── User.js              # User schema
│   ├── Booking.js           # Booking schema
│   ├── Service.js           # Service schema
│   └── Category.js          # Category schema
├── routes/
│   ├── authRoutes.js        # Auth endpoints
│   ├── bookingRoutes.js     # Booking endpoints
│   ├── serviceRoutes.js     # Service endpoints
│   └── userRoutes.js        # User endpoints
└── utils/
    └── jwt.js               # JWT utilities
```

## Technology Stack

### Frontend
- **Framework**: Flutter
- **State Management**: Riverpod
- **Navigation**: GoRouter
- **HTTP Client**: Dio
- **Local Storage**: Shared Preferences

### Backend
- **Framework**: Express.js
- **Database**: MongoDB
- **Authentication**: JWT
- **Utilities**: Bcryptjs for password hashing

## Key Features

1. **Authentication**: User login, registration, password reset
2. **Booking Management**: Create, view, and cancel bookings
3. **Service Discovery**: Browse, search, and filter services
4. **User Profiles**: Edit profile, favorites, booking history
5. **Business Dashboard**: Analytics, manage bookings, add services
6. **Admin Panel**: User and service management
7. **Notifications**: Local notifications and alerts
8. **Calendar**: View appointments and bookings

## Environment Setup

### Flutter
```bash
flutter pub get
flutter run
```

### Backend
```bash
cd backend
npm install
npm start
```

## API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration
- `POST /api/auth/logout` - User logout
- `POST /api/auth/verify-otp` - OTP verification
- `POST /api/auth/reset-password` - Password reset

### Bookings
- `GET /api/bookings` - Get all bookings
- `GET /api/bookings/:id` - Get booking details
- `POST /api/bookings` - Create booking
- `PUT /api/bookings/:id` - Update booking

### Services
- `GET /api/services` - Get all services
- `GET /api/services/:id` - Get service details
- `POST /api/services` - Create service
- `PUT /api/services/:id` - Update service
- `DELETE /api/services/:id` - Delete service

### Users
- `GET /api/users/profile` - Get user profile
- `PUT /api/users/profile` - Update user profile
- `DELETE /api/users/:id` - Delete user

## Color Scheme
- **Primary**: #6C5CE7
- **Secondary**: #00B894
- **Error**: #D63031
- **Success**: #00B894
- **Warning**: #FDCB6E

## Font Family
- **Font**: Poppins
- **Weights**: Regular, Medium, SemiBold, Bold
