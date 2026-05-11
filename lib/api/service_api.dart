import '../core/services/api_service.dart';

class ServiceApi {
  final ApiService apiService = ApiService();

  Future<dynamic> getAllServices() async {
    return await apiService.get('/services');
  }

  Future<dynamic> getServiceById(String serviceId) async {
    return await apiService.get('/services/$serviceId');
  }

  Future<dynamic> getServicesByCategory(String category) async {
    return await apiService.get('/services', queryParameters: {'category': category});
  }

  Future<dynamic> searchServices(String query) async {
    return await apiService.get('/services/search', queryParameters: {'q': query});
  }

  Future<dynamic> addService(Map<String, dynamic> serviceData) async {
    return await apiService.post('/services', data: serviceData);
  }

  Future<dynamic> updateService(String serviceId, Map<String, dynamic> serviceData) async {
    return await apiService.put('/services/$serviceId', data: serviceData);
  }

  Future<dynamic> deleteService(String serviceId) async {
    return await apiService.delete('/services/$serviceId');
  }

  Future<dynamic> toggleFavorite(String serviceId) async {
    return await apiService.post('/services/$serviceId/favorite');
  }
}
