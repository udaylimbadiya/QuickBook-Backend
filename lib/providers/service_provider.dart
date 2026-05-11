import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceProvider = StateNotifierProvider((ref) => ServiceNotifier());

class ServiceNotifier extends StateNotifier<ServiceState> {
  ServiceNotifier() : super(const ServiceState());

  void fetchServices() {
    state = state.copyWith(isLoading: true);
    // Implement fetch services logic
  }

  void fetchServicesByCategory(String category) {
    state = state.copyWith(isLoading: true);
    // Implement fetch services by category logic
  }

  void searchServices(String query) {
    state = state.copyWith(isLoading: true);
    // Implement search services logic
  }

  void toggleFavorite(String serviceId) {
    // Implement toggle favorite logic
  }
}

class ServiceState {
  final bool isLoading;
  final List<dynamic> services;
  final List<dynamic> categories;
  final String? errorMessage;

  const ServiceState({
    this.isLoading = false,
    this.services = const [],
    this.categories = const [],
    this.errorMessage,
  });

  ServiceState copyWith({
    bool? isLoading,
    List<dynamic>? services,
    List<dynamic>? categories,
    String? errorMessage,
  }) {
    return ServiceState(
      isLoading: isLoading ?? this.isLoading,
      services: services ?? this.services,
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
