const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
require("dotenv").config();

const bookingRoutes =
require("./routes/bookingRoutes");

const authRoutes =
require("./routes/authRoutes");

const serviceRoutes =
require("./routes/serviceRoutes");

const app = express();

app.use(cors());

app.use(express.json());

mongoose.connect(
process.env.MONGO_URI
)
.then(() => {
  console.log("MongoDB Connected");
})
.catch((err) => {
  console.log(err);
});

app.get("/", (req, res) => {

  res.status(200).json({

    success: true,

    message:
      "QuickBook Backend Running",

  });

});

app.use(
"/api/bookings",
bookingRoutes,
);

app.use(
"/api/auth",
authRoutes,
);

app.use(
"/api/services",
serviceRoutes,
);

module.exports = app;