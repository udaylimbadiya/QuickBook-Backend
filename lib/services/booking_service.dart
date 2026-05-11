import '../api/booking_api.dart';
import '../models/booking_model.dart';

class BookingService {
  final BookingApi _bookingApi = BookingApi();

  Future<List<BookingModel>> getBookings() async {
    try {
      final response = await _bookingApi.getBookings();
      return (response as List).map((json) => BookingModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load bookings: $e');
    }
  }

  Future<BookingModel> getBookingById(String bookingId) async {
    try {
      final response = await _bookingApi.getBookingById(bookingId);
      return BookingModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to load booking: $e');
    }
  }

  Future<BookingModel> createBooking(String serviceId, DateTime date, String timeSlot, double totalPrice) async {
    try {
      final response = await _bookingApi.createBooking(serviceId, date, timeSlot, totalPrice);
      return BookingModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to create booking: $e');
    }
  }

  Future<void> cancelBooking(String bookingId) async {
    try {
      await _bookingApi.cancelBooking(bookingId);
    } catch (e) {
      throw Exception('Failed to cancel booking: $e');
    }
  }

  Future<void> updateBookingStatus(String bookingId, String status) async {
    try {
      await _bookingApi.updateBookingStatus(bookingId, status);
    } catch (e) {
      throw Exception('Failed to update booking status: $e');
    }
  }
}