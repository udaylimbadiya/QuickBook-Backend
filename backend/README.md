# QuickBook Backend

Express.js backend for QuickBook Flutter app with MongoDB Atlas.

## Setup

1. Install dependencies:
```bash
npm install
```

2. Create `.env` file with your MongoDB Atlas URI:
```
MONGO_URI=your_mongodb_atlas_connection_string
PORT=5000
```

3. For local development:
```bash
npm run dev
```

4. For production:
```bash
npm start
```

## Vercel Deployment

1. Push this backend folder to GitHub
2. Connect your GitHub repo to Vercel
3. Add environment variables in Vercel dashboard:
   - `MONGO_URI`
   - `NODE_ENV=production`
4. Deploy

## API Endpoints

- `GET /` - Health check
- `GET /api/bookings` - Get all bookings
- `POST /api/bookings` - Create booking
- `PUT /api/bookings/:id` - Update booking
- `DELETE /api/bookings/:id` - Delete booking

## Environment Variables

- `MONGO_URI` - MongoDB Atlas connection string
- `PORT` - Server port (default: 5000)