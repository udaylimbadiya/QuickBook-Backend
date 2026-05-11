const functions = require("firebase-functions");
const admin = require("firebase-admin");
const express = require("express");

admin.initializeApp();

const db = admin.firestore();

const app = express();

app.use(express.json());

/// TEST ROUTE
app.get("/", (req, res) => {

    res.send("QuickBook Firebase Backend Live ✅");

});

/// CREATE BOOKING
app.post("/bookings", async (req, res) => {

    try {

        const bookingData = {

            serviceName: req.body.serviceName,

            serviceImage: req.body.serviceImage,

            location: req.body.location,

            price: req.body.price,

            date: req.body.date,

            time: req.body.time,

            createdAt:
                admin.firestore.FieldValue.serverTimestamp(),

        };

        const bookingRef =
            await db.collection("bookings")
            .add(bookingData);

        res.status(201).json({

            success: true,

            message:
                "Booking Created Successfully",

            bookingId:
                bookingRef.id,

            data:
                bookingData,

        });

    } catch (error) {

        res.status(500).json({

            success: false,

            error: error.message,

        });

    }

});

/// GET ALL BOOKINGS
app.get("/bookings", async (req, res) => {

    try {

        const snapshot =
            await db.collection("bookings")
            .get();

        const bookings =
            snapshot.docs.map((doc) => ({

                id: doc.id,

                ...doc.data(),

            }));

        res.status(200).json({

            success: true,

            total:
                bookings.length,

            data:
                bookings,

        });

    } catch (error) {

        res.status(500).json({

            success: false,

            error: error.message,

        });

    }

});

exports.api =
functions.https.onRequest(app);