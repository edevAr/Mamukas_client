import '../entities/sale.dart';

abstract class SaleRepository {
  Future<List<Sale>> getAllSales();
  Future<Sale?> getSaleById(int id);
  Future<List<Sale>> getSalesByEmployee(int employeeId);
  Future<List<Sale>> getSalesByClient(int clientId);
  Future<List<Sale>> getSalesByProduct(int productId);
  Future<int> insertSale(Sale sale);
  Future<bool> updateSale(Sale sale);
  Future<bool> deleteSale(int id);
  Future<double> getTotalSalesByEmployee(int employeeId);
  Future<double> getTotalSalesByClient(int clientId);
}