import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/user_usecases.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUsersUseCase getAllUsersUseCase;
  final GetUserByIdUseCase getUserByIdUseCase;
  final GetUserByUsernameUseCase getUserByUsernameUseCase;
  final CreateUserUseCase createUserUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final DeleteUserUseCase deleteUserUseCase;
  final AuthenticateUserUseCase authenticateUserUseCase;

  UserBloc({
    required this.getAllUsersUseCase,
    required this.getUserByIdUseCase,
    required this.getUserByUsernameUseCase,
    required this.createUserUseCase,
    required this.updateUserUseCase,
    required this.deleteUserUseCase,
    required this.authenticateUserUseCase,
  }) : super(UserInitial()) {
    on<LoadAllUsers>(_onLoadAllUsers);
    on<LoadUserById>(_onLoadUserById);
    on<LoadUserByUsername>(_onLoadUserByUsername);
    on<CreateUser>(_onCreateUser);
    on<UpdateUser>(_onUpdateUser);
    on<DeleteUser>(_onDeleteUser);
    on<AuthenticateUser>(_onAuthenticateUser);
  }

  Future<void> _onLoadAllUsers(
    LoadAllUsers event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final users = await getAllUsersUseCase();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError('Failed to load users: ${e.toString()}'));
    }
  }

  Future<void> _onLoadUserById(
    LoadUserById event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final user = await getUserByIdUseCase(event.id);
      if (user != null) {
        emit(UserDetailsLoaded(user));
      } else {
        emit(UserNotFound());
      }
    } catch (e) {
      emit(UserError('Failed to load user: ${e.toString()}'));
    }
  }

  Future<void> _onLoadUserByUsername(
    LoadUserByUsername event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final user = await getUserByUsernameUseCase(event.username);
      if (user != null) {
        emit(UserDetailsLoaded(user));
      } else {
        emit(UserNotFound());
      }
    } catch (e) {
      emit(UserError('Failed to load user: ${e.toString()}'));
    }
  }

  Future<void> _onCreateUser(
    CreateUser event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final userId = await createUserUseCase(event.user);
      emit(UserCreated(userId));
    } catch (e) {
      emit(UserError('Failed to create user: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateUser(
    UpdateUser event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final success = await updateUserUseCase(event.user);
      if (success) {
        emit(UserUpdated());
      } else {
        emit(UserError('Failed to update user'));
      }
    } catch (e) {
      emit(UserError('Failed to update user: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteUser(
    DeleteUser event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final success = await deleteUserUseCase(event.id);
      if (success) {
        emit(UserDeleted());
      } else {
        emit(UserError('Failed to delete user'));
      }
    } catch (e) {
      emit(UserError('Failed to delete user: ${e.toString()}'));
    }
  }

  Future<void> _onAuthenticateUser(
    AuthenticateUser event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final isAuthenticated = await authenticateUserUseCase(
        event.username,
        event.password,
      );
      emit(UserAuthenticated(isAuthenticated));
    } catch (e) {
      emit(UserError('Authentication failed: ${e.toString()}'));
    }
  }
}