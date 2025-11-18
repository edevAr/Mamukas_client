import 'package:equatable/equatable.dart';
import '../../../core/constants/gender.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;

  const LoginRequested({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}

class RegisterRequested extends AuthEvent {
  final String username;
  final String password;
  final String name;
  final String lastName;
  final String ci;
  final int age;
  final String email;
  final Gender gender;

  const RegisterRequested({
    required this.username,
    required this.password,
    required this.name,
    required this.lastName,
    required this.ci,
    required this.age,
    required this.email,
    required this.gender,
  });

  @override
  List<Object> get props => [
        username,
        password,
        name,
        lastName,
        ci,
        age,
        email,
        gender,
      ];
}

class ForgotPasswordRequested extends AuthEvent {
  final String usernameOrEmail;

  const ForgotPasswordRequested({
    required this.usernameOrEmail,
  });

  @override
  List<Object> get props => [usernameOrEmail];
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

class CheckAuthStatus extends AuthEvent {
  const CheckAuthStatus();
}