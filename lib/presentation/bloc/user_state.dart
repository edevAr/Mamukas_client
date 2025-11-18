import 'package:equatable/equatable.dart';
import '../../../domain/entities/user.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;

  const UserLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UserDetailsLoaded extends UserState {
  final User user;

  const UserDetailsLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserCreated extends UserState {
  final int userId;

  const UserCreated(this.userId);

  @override
  List<Object> get props => [userId];
}

class UserUpdated extends UserState {}

class UserDeleted extends UserState {}

class UserAuthenticated extends UserState {
  final bool isAuthenticated;

  const UserAuthenticated(this.isAuthenticated);

  @override
  List<Object> get props => [isAuthenticated];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}

class UserNotFound extends UserState {}