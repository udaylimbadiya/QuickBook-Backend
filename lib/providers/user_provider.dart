import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider((ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(const UserState());

  void fetchUserProfile() {
    state = state.copyWith(isLoading: true);
    // Implement fetch user profile logic
  }

  void updateUserProfile(String name, String email, String phone) {
    state = state.copyWith(isLoading: true);
    // Implement update user profile logic
  }

  void updateProfileImage(String imagePath) {
    // Implement update profile image logic
  }
}

class UserState {
  final bool isLoading;
  final dynamic user;
  final String? errorMessage;

  const UserState({
    this.isLoading = false,
    this.user,
    this.errorMessage,
  });

  UserState copyWith({
    bool? isLoading,
    dynamic user,
    String? errorMessage,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
