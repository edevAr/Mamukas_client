import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

class GetAllCustomersUseCase {
  final CustomerRepository repository;

  GetAllCustomersUseCase({required this.repository});

  Future<List<Customer>> call() async {
    return await repository.getAllCustomers();
  }
}

class GetCustomerByIdUseCase {
  final CustomerRepository repository;

  GetCustomerByIdUseCase({required this.repository});

  Future<Customer?> call(int id) async {
    return await repository.getCustomerById(id);
  }
}

class GetCustomerByNitUseCase {
  final CustomerRepository repository;

  GetCustomerByNitUseCase({required this.repository});

  Future<Customer?> call(String nit) async {
    return await repository.getCustomerByNit(nit);
  }
}

class SearchCustomersByNameUseCase {
  final CustomerRepository repository;

  SearchCustomersByNameUseCase({required this.repository});

  Future<List<Customer>> call(String name) async {
    return await repository.searchCustomersByName(name);
  }
}

class CreateCustomerUseCase {
  final CustomerRepository repository;

  CreateCustomerUseCase({required this.repository});

  Future<int> call(Customer customer) async {
    return await repository.insertCustomer(customer);
  }
}

class UpdateCustomerUseCase {
  final CustomerRepository repository;

  UpdateCustomerUseCase({required this.repository});

  Future<bool> call(Customer customer) async {
    return await repository.updateCustomer(customer);
  }
}

class DeleteCustomerUseCase {
  final CustomerRepository repository;

  DeleteCustomerUseCase({required this.repository});

  Future<bool> call(int id) async {
    return await repository.deleteCustomer(id);
  }
}