import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/user.dart';
import '../../../core/constants/user_status.dart';
import '../../../core/constants/gender.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class SimpleAuthBloc extends Bloc<AuthEvent, AuthState> {
  SimpleAuthBloc() : super(const AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  // Demo users for testing
  final List<User> _demoUsers = [
    User(
      idUser: 1,
      username: 'admin',
      password: '123456',
      name: 'Administrador',
      lastName: 'Sistema',
      ci: '12345678',
      age: 30,
      status: UserStatus.active,
      email: 'admin@mamuka.com',
      gender: Gender.other,
    ),
    User(
      idUser: 2,
      username: 'demo',
      password: '123456',
      name: 'Usuario',
      lastName: 'Demo',
      ci: '87654321',
      age: 25,
      status: UserStatus.active,
      email: 'demo@mamuka.com',
      gender: Gender.male,
    ),
  ];

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    try {
      final user = _demoUsers.where((u) => 
        u.username == event.username && 
        u.password == event.password &&
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
    emit(const AuthUnauthenticated());
  }
}