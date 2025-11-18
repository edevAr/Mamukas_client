import 'package:drift/drift.dart';

@DataClassName('OrderEntryModel')
class OrderEntryModels extends Table {
  IntColumn get idOrder => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get status => text()();
  IntColumn get idProvider => integer()();

  @override
  String get tableName => 'order_entries';
}