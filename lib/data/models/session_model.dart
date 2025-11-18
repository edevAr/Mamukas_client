import 'package:drift/drift.dart';

@DataClassName('SessionModel')
class SessionModels extends Table {
  IntColumn get idSession => integer().autoIncrement()();
  TextColumn get status => text()();
  TextColumn get device => text().withLength(min: 1, max: 100)();
  TextColumn get ip => text().withLength(min: 7, max: 45)(); // IPv4: 7-15, IPv6: up to 45

  @override
  String get tableName => 'sessions';
}