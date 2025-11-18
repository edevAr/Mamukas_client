import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:mamuka_erp/core/constants/gender.dart';
import 'package:mamuka_erp/core/constants/user_status.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../models/user_model.dart';
import '../models/sale_model.dart';
import '../models/order_entry_model.dart';
import '../models/order_output_model.dart';
import '../models/order_detail_model.dart';
import '../models/customer_model.dart';
import '../models/session_model.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  UserModels,
  SaleModels,
  OrderEntryModels,
  OrderOutputModels,
  OrderDetailModels,
  CustomerModels,
  SessionModels,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 6;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'mamuka_erp.db'));
      return NativeDatabase(file);
    });
  }
}