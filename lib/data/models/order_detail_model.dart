import 'package:drift/drift.dart';

@DataClassName('OrderDetailModel')
class OrderDetailModels extends Table {
  IntColumn get idDetail => integer().autoIncrement()();
  IntColumn get idOrder => integer()();
  IntColumn get amount => integer().check(amount.isBiggerThanValue(0))();

  @override
  String get tableName => 'order_details';
}