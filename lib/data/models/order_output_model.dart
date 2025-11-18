import 'package:drift/drift.dart';

@DataClassName('OrderOutputModel')
class OrderOutputModels extends Table {
  IntColumn get idOrder => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get status => text()();
  IntColumn get idCustomer => integer()();

  @override
  String get tableName => 'order_outputs';
}