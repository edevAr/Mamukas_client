import '../entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
  Future<User?> getUserById(int id);
  Future<User?> getUserByUsername(String username);
  Future<int> insertUser(User user);
  Future<bool> updateUser(User user);
  Future<bool> deleteUser(int id);
  Future<bool> authenticateUser(String username, String password);
}