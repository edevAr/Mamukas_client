import 'package:equatable/equatable.dart';
import '../../domain/entities/customer.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class LoadAllCustomers extends CustomerEvent {}

class LoadCustomerById extends CustomerEvent {
  final int id;

  const LoadCustomerById(this.id);

  @override
  List<Object> get props => [id];
}

class LoadCustomerByNit extends CustomerEvent {
  final String nit;

  const LoadCustomerByNit(this.nit);

  @override
  List<Object> get props => [nit];
}

class SearchCustomersByName extends CustomerEvent {
  final String name;

  const SearchCustomersByName(this.name);

  @override
  List<Object> get props => [name];
}

class CreateCustomer extends CustomerEvent {
  final Customer customer;

  const CreateCustomer(this.customer);

  @override
  List<Object> get props => [customer];
}

class UpdateCustomer extends CustomerEvent {
  final Customer customer;

  const UpdateCustomer(this.customer);

  @override
  List<Object> get props => [customer];
}

class DeleteCustomer extends CustomerEvent {
  final int id;

  const DeleteCustomer(this.id);

  @override
  List<Object> get props => [id];
}