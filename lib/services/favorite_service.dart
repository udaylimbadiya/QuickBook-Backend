import '../api/service_api.dart';
import '../models/service_model.dart';

class FavoriteService {
  final ServiceApi _serviceApi = ServiceApi();

  Future<List<ServiceModel>> getFavoriteServices() async {
    try {
      // Assuming there's an endpoint for favorites, or filter from all services
      final response = await _serviceApi.getAllServices();
      // For now, return all services - in real app, filter by favorites
      return (response as List).map((json) => ServiceModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load favorite services: $e');
    }
  }

  Future<void> toggleFavorite(String serviceId) async {
    try {
      await _serviceApi.toggleFavorite(serviceId);
    } catch (e) {
      throw Exception('Failed to toggle favorite: $e');
    }
  }

  Future<bool> isFavorite(String serviceId) async {
    try {
      // This would need a specific API endpoint
      // For now, return false
      return false;
    } catch (e) {
      return false;
    }
  }
}