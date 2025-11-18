import 'package:equatable/equatable.dart';
import '../../domain/entities/sale.dart';

abstract class SaleEvent extends Equatable {
  const SaleEvent();

  @override
  List<Object> get props => [];
}

class LoadAllSales extends SaleEvent {}

class LoadSaleById extends SaleEvent {
  final int id;

  const LoadSaleById(this.id);

  @override
  List<Object> get props => [id];
}

class LoadSalesByEmployee extends SaleEvent {
  final int employeeId;

  const LoadSalesByEmployee(this.employeeId);

  @override
  List<Object> get props => [employeeId];
}

class LoadSalesByClient extends SaleEvent {
  final int clientId;

  const LoadSalesByClient(this.clientId);

  @override
  List<Object> get props => [clientId];
}

class LoadSalesByProduct extends SaleEvent {
  final int productId;

  const LoadSalesByProduct(this.productId);

  @override
  List<Object> get props => [productId];
}

class CreateSale extends SaleEvent {
  final Sale sale;

  const CreateSale(this.sale);

  @override
  List<Object> get props => [sale];
}

class UpdateSale extends SaleEvent {
  final Sale sale;

  const UpdateSale(this.sale);

  @override
  List<Object> get props => [sale];
}

class DeleteSale extends SaleEvent {
  final int id;

  const DeleteSale(this.id);

  @override
  List<Object> get props => [id];
}

class LoadTotalSalesByEmployee extends SaleEvent {
  final int employeeId;

  const LoadTotalSalesByEmployee(this.employeeId);

  @override
  List<Object> get props => [employeeId];
}

class LoadTotalSalesByClient extends SaleEvent {
  final int clientId;

  const LoadTotalSalesByClient(this.clientId);

  @override
  List<Object> get props => [clientId];
}