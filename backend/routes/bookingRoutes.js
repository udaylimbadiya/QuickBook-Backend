const express = require('express');

const router = express.Router();

const Booking =
require('../models/Booking');

/// CREATE BOOKING
router.post(
'/',
async (req, res) => {

  console.log(
    'NEW BOOKING:',
    req.body,
  );

  try {

    const booking =
    new Booking({

      serviceName:
          req.body.serviceName,

      serviceImage:
          req.body.serviceImage,

      location:
          req.body.location,

      price:
          req.body.price,

      date:
          req.body.date,

      time:
          req.body.time,

    });

    const savedBooking =
    await booking.save();

    console.log(
      'BOOKING SAVED:',
      savedBooking,
    );

    res.status(201).json({

      success: true,

      message:
          'Appointment Booked Successfully',

      data: savedBooking,

    });

  } catch (error) {

    console.log(
      'SAVE ERROR:',
      error,
    );

    res.status(500).json({

      success: false,

      error: error.toString(),

    });

  }

},
);

/// GET ALL BOOKINGS
router.get(
'/',
async (req, res) => {

  try {

    const bookings =
    await Booking.find()
    .sort({
      createdAt: -1,
    });

    res.status(200).json({

      success: true,

      total:
          bookings.length,

      data: bookings,

    });

  } catch (error) {

    console.log(
      'FETCH ERROR:',
      error,
    );

    res.status(500).json({

      success: false,

      error: error.toString(),

    });

  }

},
);

/// GET BOOKINGS BY DATE
router.get(
'/date/:date',
async (req, res) => {

  try {

    const selectedDate =
        req.params.date;

    const bookings =
    await Booking.find({

      date: {
        $regex:
            selectedDate,
      },

    });

    res.status(200).json({

      success: true,

      total:
          bookings.length,

      data: bookings,

    });

  } catch (error) {

    console.log(
      'DATE FETCH ERROR:',
      error,
    );

    res.status(500).json({

      success: false,

      error: error.toString(),

    });

  }

},
);

/// GET UPCOMING BOOKINGS
router.get(
'/upcoming',
async (req, res) => {

  try {

    const bookings =
    await Booking.find()
    .sort({
      createdAt: -1,
    })
    .limit(10);

    res.status(200).json({

      success: true,

      total:
          bookings.length,

      data: bookings,

    });

  } catch (error) {

    console.log(
      'UPCOMING ERROR:',
      error,
    );

    res.status(500).json({

      success: false,

      error: error.toString(),

    });

  }

},
);

/// DELETE BOOKING
router.delete(
'/:id',
async (req, res) => {

  try {

    const deletedBooking =
    await Booking.findByIdAndDelete(
      req.params.id,
    );

    if (!deletedBooking) {

      return res.status(404).json({

        success: false,

        message:
            'Booking Not Found',

      });

    }

    res.status(200).json({

      success: true,

      message:
          'Booking Deleted Successfully',

      data: deletedBooking,

    });

  } catch (error) {

    console.log(
      'DELETE ERROR:',
      error,
    );

    res.status(500).json({

      success: false,

      error: error.toString(),

    });

  }

},
);

module.exports = router;