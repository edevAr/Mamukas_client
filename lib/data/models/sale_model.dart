import 'package:drift/drift.dart';

@DataClassName('SaleModel')
class SaleModels extends Table {
  IntColumn get idSale => integer().autoIncrement()();
  IntColumn get idEmployee => integer()();
  IntColumn get idProduct => integer()();
  IntColumn get amount => integer().check(amount.isBiggerThanValue(0))();
  IntColumn get idClient => integer()();
  RealColumn get subtotal => real().check(subtotal.isBiggerOrEqualValue(0))();
  RealColumn get total => real().check(total.isBiggerOrEqualValue(0))();
  RealColumn get cashDiscount => real().check(cashDiscount.isBiggerOrEqualValue(0))();

  @override
  String get tableName => 'sales';
}