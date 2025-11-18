import 'package:equatable/equatable.dart';
import '../../../domain/entities/user.dart';

enum AuthenticationStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  registering,
  registered,
  error,
  passwordResetSent,
}

class AuthState extends Equatable {
  final AuthenticationStatus status;
  final User? user;
  final String? errorMessage;

  const AuthState({
    this.status = AuthenticationStatus.initial,
    this.user,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthenticationStatus? status,
    User? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];

  @override
  String toString() {
    return 'AuthState(status: $status, user: $user, errorMessage: $errorMessage)';
  }
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(status: AuthenticationStatus.initial);
}

class AuthLoading extends AuthState {
  const AuthLoading() : super(status: AuthenticationStatus.loading);
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({required User user})
      : super(status: AuthenticationStatus.authenticated, user: user);
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated({String? errorMessage})
      : super(status: AuthenticationStatus.unauthenticated, errorMessage: errorMessage);
}

class AuthRegistering extends AuthState {
  const AuthRegistering() : super(status: AuthenticationStatus.registering);
}

class AuthRegistered extends AuthState {
  const AuthRegistered() : super(status: AuthenticationStatus.registered);
}

class AuthError extends AuthState {
  const AuthError({required String errorMessage})
      : super(status: AuthenticationStatus.error, errorMessage: errorMessage);
}

class PasswordResetSent extends AuthState {
  const PasswordResetSent()
      : super(status: AuthenticationStatus.passwordResetSent);
}