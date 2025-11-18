import 'package:drift/drift.dart';
import '../../domain/entities/user.dart' as domain;
import '../../domain/repositories/user_repository.dart';
import '../database/app_database.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final AppDatabase database;

  UserRepositoryImpl({required this.database});

  @override
  Future<List<domain.User>> getAllUsers() async {
    final users = await database.select(database.userModels).get();
    return users.map((userModel) => userModel.toDomain()).toList();
  }

  @override
  Future<domain.User?> getUserById(int id) async {
    final query = database.select(database.userModels)
      ..where((user) => user.idUser.equals(id));
    
    final userModel = await query.getSingleOrNull();
    return userModel?.toDomain();
  }

  @override
  Future<domain.User?> getUserByUsername(String username) async {
    final query = database.select(database.userModels)
      ..where((user) => user.username.equals(username));
    
    final userModel = await query.getSingleOrNull();
    return userModel?.toDomain();
  }

  @override
  Future<int> insertUser(domain.User user) async {
    final companion = user.toCompanion();
    return await database.into(database.userModels).insert(companion);
  }

  @override
  Future<bool> updateUser(domain.User user) async {
    if (user.idUser == null) return false;
    
    final companion = user.toCompanion();
    final affectedRows = await (database.update(database.userModels)
          ..where((u) => u.idUser.equals(user.idUser!)))
        .write(companion);
    
    return affectedRows > 0;
  }

  @override
  Future<bool> deleteUser(int id) async {
    final affectedRows = await (database.delete(database.userModels)
          ..where((user) => user.idUser.equals(id)))
        .go();
    
    return affectedRows > 0;
  }

  @override
  Future<bool> authenticateUser(String username, String password) async {
    final query = database.select(database.userModels)
      ..where((user) => 
          user.username.equals(username) & 
          user.password.equals(password));
    
    final userModel = await query.getSingleOrNull();
    return userModel != null;
  }
}