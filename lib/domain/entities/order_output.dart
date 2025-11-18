import 'package:equatable/equatable.dart';
import '../../core/constants/order_status.dart';

class OrderOutput extends Equatable {
  final int? idOrder;
  final DateTime date;
  final OrderStatus status;
  final int idCustomer;

  const OrderOutput({
    this.idOrder,
    required this.date,
    required this.status,
    required this.idCustomer,
  });

  OrderOutput copyWith({
    int? idOrder,
    DateTime? date,
    OrderStatus? status,
    int? idCustomer,
  }) {
    return OrderOutput(
      idOrder: idOrder ?? this.idOrder,
      date: date ?? this.date,
      status: status ?? this.status,
      idCustomer: idCustomer ?? this.idCustomer,
    );
  }

  @override
  List<Object?> get props => [
        idOrder,
        date,
        status,
        idCustomer,
      ];

  @override
  String toString() {
    return 'OrderOutput(idOrder: $idOrder, date: $date, status: $status, idCustomer: $idCustomer)';
  }
}