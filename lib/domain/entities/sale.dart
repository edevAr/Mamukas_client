import 'package:equatable/equatable.dart';

class Sale extends Equatable {
  final int? idSale;
  final int idEmployee;
  final int idProduct;
  final int amount;
  final int idClient;
  final double subtotal;
  final double total;
  final double cashDiscount;

  const Sale({
    this.idSale,
    required this.idEmployee,
    required this.idProduct,
    required this.amount,
    required this.idClient,
    required this.subtotal,
    required this.total,
    required this.cashDiscount,
  });

  Sale copyWith({
    int? idSale,
    int? idEmployee,
    int? idProduct,
    int? amount,
    int? idClient,
    double? subtotal,
    double? total,
    double? cashDiscount,
  }) {
    return Sale(
      idSale: idSale ?? this.idSale,
      idEmployee: idEmployee ?? this.idEmployee,
      idProduct: idProduct ?? this.idProduct,
      amount: amount ?? this.amount,
      idClient: idClient ?? this.idClient,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      cashDiscount: cashDiscount ?? this.cashDiscount,
    );
  }

  @override
  List<Object?> get props => [
        idSale,
        idEmployee,
        idProduct,
        amount,
        idClient,
        subtotal,
        total,
        cashDiscount,
      ];

  @override
  String toString() {
    return 'Sale(idSale: $idSale, idEmployee: $idEmployee, idProduct: $idProduct, amount: $amount, idClient: $idClient, subtotal: $subtotal, total: $total, cashDiscount: $cashDiscount)';
  }
}