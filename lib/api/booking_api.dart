import '../core/services/api_service.dart';

class BookingApi {
  final ApiService apiService = ApiService();

  Future<dynamic> getBookings() async {
    return await apiService.get('/bookings');
  }

  Future<dynamic> getBookingById(String bookingId) async {
    return await apiService.get('/bookings/$bookingId');
  }

  Future<dynamic> createBooking(String serviceId, DateTime date, String timeSlot, double totalPrice) async {
    return await apiService.post(
      '/bookings',
      data: {
        'serviceId': serviceId,
        'bookingDate': date.toIso8601String(),
        'timeSlot': timeSlot,
        'totalPrice': totalPrice,
      },
    );
  }

  Future<dynamic> cancelBooking(String bookingId) async {
    return await apiService.put(
      '/bookings/$bookingId',
      data: {'status': 'cancelled'},
    );
  }

  Future<dynamic> updateBookingStatus(String bookingId, String status) async {
    return await apiService.put(
      '/bookings/$bookingId',
      data: {'status': status},
    );
  }
}
