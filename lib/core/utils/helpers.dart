import 'package:intl/intl.dart';

class Helpers {
  // Format date
  static String formatDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  // Format time
  static String formatTime(DateTime time, {String format = 'hh:mm a'}) {
    return DateFormat(format).format(time);
  }

  // Format price
  static String formatPrice(double price, {String symbol = '₹'}) {
    return '$symbol${price.toStringAsFixed(2)}';
  }

  // Get initials from name
  static String getInitials(String name) {
    return name
        .split(' ')
        .where((element) => element.isNotEmpty)
        .map((element) => element[0])
        .join()
        .toUpperCase();
  }

  // Check if email is valid
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  // Format duration
  static String formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final hours = duration.inHours;
    if (hours > 0) {
      return '${hours}h ${minutes % 60}m';
    }
    return '${minutes}m';
  }
}
