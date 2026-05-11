
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config();

const bookingRoutes =
require('./routes/bookingRoutes');

const app = express();

/// MIDDLEWARE
app.use(cors());
app.use(express.json());

/// DATABASE CONNECTION
mongoose.connect(process.env.MONGO_URI)

.then(() => {

console.log(
'MongoDB Connected Successfully',
);

})

.catch((error) => {

console.log(error);

});

/// ROUTES
app.use(
'/api/bookings',
bookingRoutes,
);

/// TEST ROUTE
app.get('/', (req, res) => {

res.send(
'QuickBook Backend Running',
);

});

/// SERVER
const PORT = process.env.PORT || 5000;

// For local development
if (require.main === module) {
  app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server Running on Port ${PORT}`);
  });
}

// Export for Vercel serverless functions
module.exports = app;
