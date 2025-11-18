import '../entities/order_output.dart';
import '../repositories/order_output_repository.dart';

class GetAllOrderOutputsUseCase {
  final OrderOutputRepository repository;

  GetAllOrderOutputsUseCase({required this.repository});

  Future<List<OrderOutput>> call() async {
    return await repository.getAllOrderOutputs();
  }
}

class GetOrderOutputByIdUseCase {
  final OrderOutputRepository repository;

  GetOrderOutputByIdUseCase({required this.repository});

  Future<OrderOutput?> call(int id) async {
    return await repository.getOrderOutputById(id);
  }
}

class GetOrderOutputsByCustomerUseCase {
  final OrderOutputRepository repository;

  GetOrderOutputsByCustomerUseCase({required this.repository});

  Future<List<OrderOutput>> call(int customerId) async {
    return await repository.getOrderOutputsByCustomer(customerId);
  }
}

class GetOrderOutputsByStatusUseCase {
  final OrderOutputRepository repository;

  GetOrderOutputsByStatusUseCase({required this.repository});

  Future<List<OrderOutput>> call(String status) async {
    return await repository.getOrderOutputsByStatus(status);
  }
}

class CreateOrderOutputUseCase {
  final OrderOutputRepository repository;

  CreateOrderOutputUseCase({required this.repository});

  Future<int> call(OrderOutput orderOutput) async {
    return await repository.insertOrderOutput(orderOutput);
  }
}

class UpdateOrderOutputUseCase {
  final OrderOutputRepository repository;

  UpdateOrderOutputUseCase({required this.repository});

  Future<bool> call(OrderOutput orderOutput) async {
    return await repository.updateOrderOutput(orderOutput);
  }
}

class DeleteOrderOutputUseCase {
  final OrderOutputRepository repository;

  DeleteOrderOutputUseCase({required this.repository});

  Future<bool> call(int id) async {
    return await repository.deleteOrderOutput(id);
  }
}