import '../core/services/api_service.dart';

class UserApi {
  final ApiService apiService = ApiService();

  Future<dynamic> getUserProfile() async {
    return await apiService.get('/users/profile');
  }

  Future<dynamic> updateUserProfile(Map<String, dynamic> profileData) async {
    return await apiService.put('/users/profile', data: profileData);
  }

  Future<dynamic> uploadProfileImage(String imagePath) async {
    // Implementation for file upload
    return await apiService.post('/users/profile/image', data: imagePath);
  }

  Future<dynamic> getUserBookingHistory() async {
    return await apiService.get('/users/bookings');
  }

  Future<dynamic> getUserFavorites() async {
    return await apiService.get('/users/favorites');
  }
}
