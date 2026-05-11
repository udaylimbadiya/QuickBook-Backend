const mongoose = require('mongoose');

const bookingSchema =
mongoose.Schema({

serviceName: {
type: String,
required: true,
},

serviceImage: {
type: String,
required: true,
},

location: {
type: String,
required: true,
},

price: {
type: Number,
required: true,
},

date: {
type: String,
required: true,
},

time: {
type: String,
required: true,
},

createdAt: {
type: Date,
default: Date.now,
},
});

module.exports = mongoose.model(
'Booking',
bookingSchema,
);
