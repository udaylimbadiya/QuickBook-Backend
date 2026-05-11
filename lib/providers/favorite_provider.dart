import 'package:flutter/material.dart';
import '../models/favorite_model.dart';
import '../models/service_model.dart';
import '../services/favorite_service.dart';

class FavoriteProvider with ChangeNotifier {
  final FavoriteService _favoriteService = FavoriteService();
  List<ServiceModel> _favoriteServices = [];
  bool _isLoading = false;

  List<ServiceModel> get favoriteServices => _favoriteServices;
  bool get isLoading => _isLoading;

  Future<void> loadFavoriteServices() async {
    _isLoading = true;
    notifyListeners();

    try {
      _favoriteServices = await _favoriteService.getFavoriteServices();
    } catch (e) {
      // Handle error
      _favoriteServices = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleFavorite(String serviceId) async {
    try {
      await _favoriteService.toggleFavorite(serviceId);
      await loadFavoriteServices(); // Reload favorites
    } catch (e) {
      // Handle error
    }
  }

  Future<bool> isFavorite(String serviceId) async {
    return await _favoriteService.isFavorite(serviceId);
  }
}