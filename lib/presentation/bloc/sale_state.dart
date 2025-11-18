import 'package:equatable/equatable.dart';
import '../../domain/entities/sale.dart';

abstract class SaleState extends Equatable {
  const SaleState();

  @override
  List<Object> get props => [];
}

class SaleInitial extends SaleState {}

class SaleLoading extends SaleState {}

class SalesLoaded extends SaleState {
  final List<Sale> sales;

  const SalesLoaded(this.sales);

  @override
  List<Object> get props => [sales];
}

class SaleLoaded extends SaleState {
  final Sale sale;

  const SaleLoaded(this.sale);

  @override
  List<Object> get props => [sale];
}

class SaleOperationSuccess extends SaleState {
  final String message;

  const SaleOperationSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class SaleTotalLoaded extends SaleState {
  final double total;

  const SaleTotalLoaded(this.total);

  @override
  List<Object> get props => [total];
}

class SaleError extends SaleState {
  final String message;

  const SaleError(this.message);

  @override
  List<Object> get props => [message];
}