import 'package:drift/drift.dart';

@DataClassName('CustomerModel')
class CustomerModels extends Table {
  IntColumn get customerId => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get lastName => text().withLength(min: 1, max: 100)();
  TextColumn get nit => text().withLength(min: 5, max: 20).unique()();

  @override
  String get tableName => 'customers';
}