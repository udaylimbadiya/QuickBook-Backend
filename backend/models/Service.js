const mongoose = require('mongoose');

const serviceSchema = new mongoose.Schema(
  {
    name: { type: String, required: true },
    description: { type: String, required: true },
    price: { type: Number, required: true },
    category: { type: mongoose.Schema.Types.ObjectId, ref: 'Category', required: true },
    provider: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    image: String,
    rating: { type: Number, default: 0 },
    reviews: { type: Number, default: 0 },
    isFavorite: { type: Boolean, default: false },
  },
  { timestamps: true }
);

module.exports = mongoose.model('Service', serviceSchema);
