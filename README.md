# QuickBook

Premium Smart Booking App built with Flutter, Express.js, and MongoDB Atlas.

## Architecture

```
Flutter App → Vercel Backend API → MongoDB Atlas
```

## Features

- 🏨 Service booking system
- 📅 Calendar integration
- 🔔 Push notifications
- 🗺️ Google Maps integration
- 💳 Payment processing ready
- 🔐 User authentication

## Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Node.js + Express.js
- **Database**: MongoDB Atlas
- **Deployment**: Vercel (Backend), Play Store/App Store (Mobile)
- **State Management**: Provider
- **API Client**: Dio + HTTP

## Setup & Development

### Prerequisites

- Flutter SDK
- Node.js & npm
- MongoDB Atlas account
- Vercel account (for deployment)

### Backend Setup

1. Navigate to backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Create `.env` file:
```env
MONGO_URI=your_mongodb_atlas_connection_string
PORT=5000
```

4. Start development server:
```bash
npm run dev
```

### Flutter Setup

1. Install dependencies:
```bash
flutter pub get
```

2. Update API base URL in `lib/services/api_service.dart`:
```dart
static const String baseUrl = 'https://your-vercel-app.vercel.app/api';
```

3. Run the app:
```bash
flutter run
```

## Deployment

### Backend Deployment (Vercel)

1. Push backend code to GitHub
2. Connect GitHub repo to Vercel
3. Add environment variables in Vercel:
   - `MONGO_URI`
   - `NODE_ENV=production`
4. Deploy automatically

### Mobile App Deployment

1. Update API URLs to production Vercel URL
2. Build for respective platforms:
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## API Documentation

### Bookings

- `GET /api/bookings` - Get all bookings
- `POST /api/bookings` - Create new booking
- `PUT /api/bookings/:id` - Update booking
- `DELETE /api/bookings/:id` - Delete booking

### Authentication

- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration
- `GET /api/auth/profile` - Get user profile

## Environment Variables

### Backend (.env)
```
MONGO_URI=mongodb+srv://...
PORT=5000
```

### Flutter (Update in code)
```dart
static const String baseUrl = 'https://your-app.vercel.app/api';
```

## Contributing

1. Fork the repository
2. Create feature branch
3. Commit changes
4. Push to branch
5. Create Pull Request

## License

MIT License
