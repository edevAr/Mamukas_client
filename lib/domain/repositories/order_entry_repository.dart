import '../entities/order_entry.dart';

abstract class OrderEntryRepository {
  Future<List<OrderEntry>> getAllOrderEntries();
  Future<OrderEntry?> getOrderEntryById(int id);
  Future<List<OrderEntry>> getOrderEntriesByProvider(int providerId);
  Future<List<OrderEntry>> getOrderEntriesByStatus(String status);
  Future<int> insertOrderEntry(OrderEntry orderEntry);
  Future<bool> updateOrderEntry(OrderEntry orderEntry);
  Future<bool> deleteOrderEntry(int id);
}