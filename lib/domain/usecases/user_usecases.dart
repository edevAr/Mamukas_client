import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetAllUsersUseCase {
  final UserRepository repository;

  GetAllUsersUseCase({required this.repository});

  Future<List<User>> call() async {
    return await repository.getAllUsers();
  }
}

class GetUserByIdUseCase {
  final UserRepository repository;

  GetUserByIdUseCase({required this.repository});

  Future<User?> call(int id) async {
    return await repository.getUserById(id);
  }
}

class GetUserByUsernameUseCase {
  final UserRepository repository;

  GetUserByUsernameUseCase({required this.repository});

  Future<User?> call(String username) async {
    return await repository.getUserByUsername(username);
  }
}

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase({required this.repository});

  Future<int> call(User user) async {
    return await repository.insertUser(user);
  }
}

class UpdateUserUseCase {
  final UserRepository repository;

  UpdateUserUseCase({required this.repository});

  Future<bool> call(User user) async {
    return await repository.updateUser(user);
  }
}

class DeleteUserUseCase {
  final UserRepository repository;

  DeleteUserUseCase({required this.repository});

  Future<bool> call(int id) async {
    return await repository.deleteUser(id);
  }
}

class AuthenticateUserUseCase {
  final UserRepository repository;

  AuthenticateUserUseCase({required this.repository});

  Future<bool> call(String username, String password) async {
    return await repository.authenticateUser(username, password);
  }
}