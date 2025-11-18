import 'package:equatable/equatable.dart';
import '../../../domain/entities/user.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class LoadAllUsers extends UserEvent {}

class LoadUserById extends UserEvent {
  final int id;

  const LoadUserById(this.id);

  @override
  List<Object> get props => [id];
}

class LoadUserByUsername extends UserEvent {
  final String username;

  const LoadUserByUsername(this.username);

  @override
  List<Object> get props => [username];
}

class CreateUser extends UserEvent {
  final User user;

  const CreateUser(this.user);

  @override
  List<Object> get props => [user];
}

class UpdateUser extends UserEvent {
  final User user;

  const UpdateUser(this.user);

  @override
  List<Object> get props => [user];
}

class DeleteUser extends UserEvent {
  final int id;

  const DeleteUser(this.id);

  @override
  List<Object> get props => [id];
}

class AuthenticateUser extends UserEvent {
  final String username;
  final String password;

  const AuthenticateUser({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}