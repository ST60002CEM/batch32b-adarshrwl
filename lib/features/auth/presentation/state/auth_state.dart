import 'package:snapdwell/features/auth/domain/entity/auth_entity.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final AuthEntity? user;

  AuthState({
    required this.isLoading,
    this.error,
    this.user,
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
      user: null,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    AuthEntity? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error)';

  void registerUser(Map<String, String> user) {}
}
