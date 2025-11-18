import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:mamuka_erp/domain/repositories/user_repository.dart';
import 'dart:convert';
import '../../../domain/entities/user.dart';
import '../../../core/constants/user_status.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(const AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    
    try {
      // Get all users to find matching username
      final users = await userRepository.getAllUsers();
      
      final user = users.where((u) => 
        u.username == event.username && 
        u.password == _hashPassword(event.password) &&
        u.status == UserStatus.active
      ).firstOrNull;

      if (user != null) {
        emit(AuthAuthenticated(user: user));
      } else {
        emit(const AuthUnauthenticated(
          errorMessage: 'Usuario o contraseña incorrectos',
        ));
      }
    } catch (e) {
      emit(AuthError(errorMessage: 'Error al iniciar sesión: ${e.toString()}'));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthRegistering());
    
    try {
      // Check if username or email already exists
      final users = await userRepository.getAllUsers();
      final existingUser = users.where((u) => 
        u.username == event.username || 
        (u.email != null && u.email == event.email)
      ).firstOrNull;

      if (existingUser != null) {
        emit(const AuthError(
          errorMessage: 'El usuario o email ya existe',
        ));
        return;
      }

      // Create new user
      final newUser = User(
        username: event.username,
        password: _hashPassword(event.password),
        name: event.name,
        lastName: event.lastName,
        ci: event.ci,
        age: event.age,
        status: UserStatus.active,
        email: event.email,
        gender: event.gender,
      );

      await userRepository.insertUser(newUser);
      emit(const AuthRegistered());
    } catch (e) {
      emit(AuthError(errorMessage: 'Error al registrar usuario: ${e.toString()}'));
    }
  }

  Future<void> _onForgotPasswordRequested(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    
    try {
      // In a real app, you would send an email here
      // For now, just simulate the process
      final users = await userRepository.getAllUsers();
      final user = users.where((u) => 
        u.username == event.usernameOrEmail || 
        (u.email != null && u.email == event.usernameOrEmail)
      ).firstOrNull;

      if (user != null) {
        // Simulate sending password reset email
        await Future.delayed(const Duration(seconds: 2));
        emit(const PasswordResetSent());
      } else {
        emit(const AuthError(
          errorMessage: 'Usuario o email no encontrado',
        ));
      }
    } catch (e) {
      emit(AuthError(errorMessage: 'Error al enviar recuperación: ${e.toString()}'));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthUnauthenticated());
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    // For now, always start as unauthenticated
    // In a real app, you would check for stored session/token
    emit(const AuthUnauthenticated());
  }
}