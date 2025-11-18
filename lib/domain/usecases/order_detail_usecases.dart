import '../entities/order_detail.dart';
import '../repositories/order_detail_repository.dart';

class GetAllOrderDetailsUseCase {
  final OrderDetailRepository repository;

  GetAllOrderDetailsUseCase({required this.repository});

  Future<List<OrderDetail>> call() async {
    return await repository.getAllOrderDetails();
  }
}

class GetOrderDetailByIdUseCase {
  final OrderDetailRepository repository;

  GetOrderDetailByIdUseCase({required this.repository});

  Future<OrderDetail?> call(int id) async {
    return await repository.getOrderDetailById(id);
  }
}

class GetOrderDetailsByOrderIdUseCase {
  final OrderDetailRepository repository;

  GetOrderDetailsByOrderIdUseCase({required this.repository});

  Future<List<OrderDetail>> call(int orderId) async {
    return await repository.getOrderDetailsByOrderId(orderId);
  }
}

class CreateOrderDetailUseCase {
  final OrderDetailRepository repository;

  CreateOrderDetailUseCase({required this.repository});

  Future<int> call(OrderDetail orderDetail) async {
    return await repository.insertOrderDetail(orderDetail);
  }
}

class UpdateOrderDetailUseCase {
  final OrderDetailRepository repository;

  UpdateOrderDetailUseCase({required this.repository});

  Future<bool> call(OrderDetail orderDetail) async {
    return await repository.updateOrderDetail(orderDetail);
  }
}

class DeleteOrderDetailUseCase {
  final OrderDetailRepository repository;

  DeleteOrderDetailUseCase({required this.repository});

  Future<bool> call(int id) async {
    return await repository.deleteOrderDetail(id);
  }
}

class DeleteOrderDetailsByOrderIdUseCase {
  final OrderDetailRepository repository;

  DeleteOrderDetailsByOrderIdUseCase({required this.repository});

  Future<bool> call(int orderId) async {
    return await repository.deleteOrderDetailsByOrderId(orderId);
  }
}