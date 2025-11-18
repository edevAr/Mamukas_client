import '../entities/customer.dart';

abstract class CustomerRepository {
  Future<List<Customer>> getAllCustomers();
  Future<Customer?> getCustomerById(int id);
  Future<Customer?> getCustomerByNit(String nit);
  Future<List<Customer>> searchCustomersByName(String name);
  Future<int> insertCustomer(Customer customer);
  Future<bool> updateCustomer(Customer customer);
  Future<bool> deleteCustomer(int id);
}