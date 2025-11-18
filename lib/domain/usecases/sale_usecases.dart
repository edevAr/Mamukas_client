import '../entities/sale.dart';
import '../repositories/sale_repository.dart';

class GetAllSalesUseCase {
  final SaleRepository repository;

  GetAllSalesUseCase({required this.repository});

  Future<List<Sale>> call() async {
    return await repository.getAllSales();
  }
}

class GetSaleByIdUseCase {
  final SaleRepository repository;

  GetSaleByIdUseCase({required this.repository});

  Future<Sale?> call(int id) async {
    return await repository.getSaleById(id);
  }
}

class GetSalesByEmployeeUseCase {
  final SaleRepository repository;

  GetSalesByEmployeeUseCase({required this.repository});

  Future<List<Sale>> call(int employeeId) async {
    return await repository.getSalesByEmployee(employeeId);
  }
}

class GetSalesByClientUseCase {
  final SaleRepository repository;

  GetSalesByClientUseCase({required this.repository});

  Future<List<Sale>> call(int clientId) async {
    return await repository.getSalesByClient(clientId);
  }
}

class GetSalesByProductUseCase {
  final SaleRepository repository;

  GetSalesByProductUseCase({required this.repository});

  Future<List<Sale>> call(int productId) async {
    return await repository.getSalesByProduct(productId);
  }
}

class CreateSaleUseCase {
  final SaleRepository repository;

  CreateSaleUseCase({required this.repository});

  Future<int> call(Sale sale) async {
    return await repository.insertSale(sale);
  }
}

class UpdateSaleUseCase {
  final SaleRepository repository;

  UpdateSaleUseCase({required this.repository});

  Future<bool> call(Sale sale) async {
    return await repository.updateSale(sale);
  }
}

class DeleteSaleUseCase {
  final SaleRepository repository;

  DeleteSaleUseCase({required this.repository});

  Future<bool> call(int id) async {
    return await repository.deleteSale(id);
  }
}

class GetTotalSalesByEmployeeUseCase {
  final SaleRepository repository;

  GetTotalSalesByEmployeeUseCase({required this.repository});

  Future<double> call(int employeeId) async {
    return await repository.getTotalSalesByEmployee(employeeId);
  }
}

class GetTotalSalesByClientUseCase {
  final SaleRepository repository;

  GetTotalSalesByClientUseCase({required this.repository});

  Future<double> call(int clientId) async {
    return await repository.getTotalSalesByClient(clientId);
  }
}