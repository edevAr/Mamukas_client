import '../entities/order_output.dart';

abstract class OrderOutputRepository {
  Future<List<OrderOutput>> getAllOrderOutputs();
  Future<OrderOutput?> getOrderOutputById(int id);
  Future<List<OrderOutput>> getOrderOutputsByCustomer(int customerId);
  Future<List<OrderOutput>> getOrderOutputsByStatus(String status);
  Future<int> insertOrderOutput(OrderOutput orderOutput);
  Future<bool> updateOrderOutput(OrderOutput orderOutput);
  Future<bool> deleteOrderOutput(int id);
}