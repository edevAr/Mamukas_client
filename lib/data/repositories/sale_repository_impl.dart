import 'package:drift/drift.dart';
import '../../domain/entities/sale.dart' as domain;
import '../../domain/repositories/sale_repository.dart';
import '../database/app_database.dart';
import '../models/sale_model_extensions.dart';

class SaleRepositoryImpl implements SaleRepository {
  final AppDatabase database;

  SaleRepositoryImpl({required this.database});

  @override
  Future<List<domain.Sale>> getAllSales() async {
    final sales = await database.select(database.saleModels).get();
    return sales.map((saleModel) => saleModel.toDomain()).toList();
  }

  @override
  Future<domain.Sale?> getSaleById(int id) async {
    final query = database.select(database.saleModels)
      ..where((sale) => sale.idSale.equals(id));
    
    final saleModel = await query.getSingleOrNull();
    return saleModel?.toDomain();
  }

  @override
  Future<List<domain.Sale>> getSalesByEmployee(int employeeId) async {
    final query = database.select(database.saleModels)
      ..where((sale) => sale.idEmployee.equals(employeeId));
    
    final sales = await query.get();
    return sales.map((saleModel) => saleModel.toDomain()).toList();
  }

  @override
  Future<List<domain.Sale>> getSalesByClient(int clientId) async {
    final query = database.select(database.saleModels)
      ..where((sale) => sale.idClient.equals(clientId));
    
    final sales = await query.get();
    return sales.map((saleModel) => saleModel.toDomain()).toList();
  }

  @override
  Future<List<domain.Sale>> getSalesByProduct(int productId) async {
    final query = database.select(database.saleModels)
      ..where((sale) => sale.idProduct.equals(productId));
    
    final sales = await query.get();
    return sales.map((saleModel) => saleModel.toDomain()).toList();
  }

  @override
  Future<int> insertSale(domain.Sale sale) async {
    final companion = sale.toCompanion();
    return await database.into(database.saleModels).insert(companion);
  }

  @override
  Future<bool> updateSale(domain.Sale sale) async {
    if (sale.idSale == null) return false;
    
    final companion = sale.toCompanion();
    final affectedRows = await (database.update(database.saleModels)
          ..where((s) => s.idSale.equals(sale.idSale!)))
        .write(companion);
    
    return affectedRows > 0;
  }

  @override
  Future<bool> deleteSale(int id) async {
    final affectedRows = await (database.delete(database.saleModels)
          ..where((sale) => sale.idSale.equals(id)))
        .go();
    
    return affectedRows > 0;
  }

  @override
  Future<double> getTotalSalesByEmployee(int employeeId) async {
    final query = database.selectOnly(database.saleModels)
      ..addColumns([database.saleModels.total.sum()])
      ..where(database.saleModels.idEmployee.equals(employeeId));
    
    final result = await query.getSingleOrNull();
    return result?.read(database.saleModels.total.sum()) ?? 0.0;
  }

  @override
  Future<double> getTotalSalesByClient(int clientId) async {
    final query = database.selectOnly(database.saleModels)
      ..addColumns([database.saleModels.total.sum()])
      ..where(database.saleModels.idClient.equals(clientId));
    
    final result = await query.getSingleOrNull();
    return result?.read(database.saleModels.total.sum()) ?? 0.0;
  }
}