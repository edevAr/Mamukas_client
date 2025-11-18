import '../entities/order_detail.dart';

abstract class OrderDetailRepository {
  Future<List<OrderDetail>> getAllOrderDetails();
  Future<OrderDetail?> getOrderDetailById(int id);
  Future<List<OrderDetail>> getOrderDetailsByOrderId(int orderId);
  Future<int> insertOrderDetail(OrderDetail orderDetail);
  Future<bool> updateOrderDetail(OrderDetail orderDetail);
  Future<bool> deleteOrderDetail(int id);
  Future<bool> deleteOrderDetailsByOrderId(int orderId);
}