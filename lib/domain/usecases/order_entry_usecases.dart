import '../entities/order_entry.dart';
import '../repositories/order_entry_repository.dart';

class GetAllOrderEntriesUseCase {
  final OrderEntryRepository repository;

  GetAllOrderEntriesUseCase({required this.repository});

  Future<List<OrderEntry>> call() async {
    return await repository.getAllOrderEntries();
  }
}

class GetOrderEntryByIdUseCase {
  final OrderEntryRepository repository;

  GetOrderEntryByIdUseCase({required this.repository});

  Future<OrderEntry?> call(int id) async {
    return await repository.getOrderEntryById(id);
  }
}

class GetOrderEntriesByProviderUseCase {
  final OrderEntryRepository repository;

  GetOrderEntriesByProviderUseCase({required this.repository});

  Future<List<OrderEntry>> call(int providerId) async {
    return await repository.getOrderEntriesByProvider(providerId);
  }
}

class GetOrderEntriesByStatusUseCase {
  final OrderEntryRepository repository;

  GetOrderEntriesByStatusUseCase({required this.repository});

  Future<List<OrderEntry>> call(String status) async {
    return await repository.getOrderEntriesByStatus(status);
  }
}

class CreateOrderEntryUseCase {
  final OrderEntryRepository repository;

  CreateOrderEntryUseCase({required this.repository});

  Future<int> call(OrderEntry orderEntry) async {
    return await repository.insertOrderEntry(orderEntry);
  }
}

class UpdateOrderEntryUseCase {
  final OrderEntryRepository repository;

  UpdateOrderEntryUseCase({required this.repository});

  Future<bool> call(OrderEntry orderEntry) async {
    return await repository.updateOrderEntry(orderEntry);
  }
}

class DeleteOrderEntryUseCase {
  final OrderEntryRepository repository;

  DeleteOrderEntryUseCase({required this.repository});

  Future<bool> call(int id) async {
    return await repository.deleteOrderEntry(id);
  }
}