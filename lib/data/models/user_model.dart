import 'package:drift/drift.dart';
import 'package:mamuka_erp/data/database/app_database.dart';
import '../../core/constants/user_status.dart';
import '../../core/constants/gender.dart';
import '../../domain/entities/user.dart' as domain;

@DataClassName('UserModel')
class UserModels extends Table {
  IntColumn get idUser => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 3, max: 50).unique()();
  TextColumn get password => text().withLength(min: 6, max: 255)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get lastName => text().withLength(min: 1, max: 100)();
  TextColumn get ci => text().withLength(min: 5, max: 20).unique()();
  IntColumn get age => integer().check(age.isBiggerThanValue(0))();
  TextColumn get status => textEnum<UserStatus>()();
  TextColumn get email => text().withLength(max: 255).nullable()();
  TextColumn get gender => textEnum<Gender>().nullable()();

  @override
  String get tableName => 'users';
}

extension UserModelExtensions on UserModel {
  domain.User toDomain() {
    return domain.User(
      idUser: idUser,
      username: username,
      password: password,
      name: name,
      lastName: lastName,
      ci: ci,
      age: age,
      status: status,
      email: email,
      gender: gender,
    );
  }
}

extension DomainUserExtensions on domain.User {
  UserModelsCompanion toCompanion() {
    return UserModelsCompanion(
      idUser: idUser != null ? Value(idUser!) : const Value.absent(),
      username: Value(username),
      password: Value(password),
      name: Value(name),
      lastName: Value(lastName),
      ci: Value(ci),
      age: Value(age),
      status: Value(status),
      email: email != null ? Value(email!) : const Value.absent(),
      gender: gender != null ? Value(gender!) : const Value.absent(),
    );
  }

  UserModel toModel() {
    return UserModel(
      idUser: idUser ?? 0,
      username: username,
      password: password,
      name: name,
      lastName: lastName,
      ci: ci,
      age: age,
      status: status,
      email: email,
      gender: gender,
    );
  }
}