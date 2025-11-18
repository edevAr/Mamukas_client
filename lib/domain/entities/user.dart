import 'package:equatable/equatable.dart';
import '../../core/constants/user_status.dart';
import '../../core/constants/gender.dart';

class User extends Equatable {
  final int? idUser;
  final String username;
  final String password;
  final String name;
  final String lastName;
  final String ci;
  final int age;
  final UserStatus status;
  final String? email;
  final Gender? gender;

  const User({
    this.idUser,
    required this.username,
    required this.password,
    required this.name,
    required this.lastName,
    required this.ci,
    required this.age,
    required this.status,
    this.email,
    this.gender,
  });

  User copyWith({
    int? idUser,
    String? username,
    String? password,
    String? name,
    String? lastName,
    String? ci,
    int? age,
    UserStatus? status,
    String? email,
    Gender? gender,
  }) {
    return User(
      idUser: idUser ?? this.idUser,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      ci: ci ?? this.ci,
      age: age ?? this.age,
      status: status ?? this.status,
      email: email ?? this.email,
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object?> get props => [
        idUser,
        username,
        password,
        name,
        lastName,
        ci,
        age,
        status,
        email,
        gender,
      ];

  @override
  String toString() {
    return 'User(idUser: $idUser, username: $username, name: $name, lastName: $lastName, ci: $ci, age: $age, status: $status, email: $email, gender: $gender)';
  }
}