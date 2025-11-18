import 'package:equatable/equatable.dart';
import '../../core/constants/order_status.dart';

class OrderEntry extends Equatable {
  final int? idOrder;
  final DateTime date;
  final OrderStatus status;
  final int idProvider;

  const OrderEntry({
    this.idOrder,
    required this.date,
    required this.status,
    required this.idProvider,
  });

  OrderEntry copyWith({
    int? idOrder,
    DateTime? date,
    OrderStatus? status,
    int? idProvider,
  }) {
    return OrderEntry(
      idOrder: idOrder ?? this.idOrder,
      date: date ?? this.date,
      status: status ?? this.status,
      idProvider: idProvider ?? this.idProvider,
    );
  }

  @override
  List<Object?> get props => [
        idOrder,
        date,
        status,
        idProvider,
      ];

  @override
  String toString() {
    return 'OrderEntry(idOrder: $idOrder, date: $date, status: $status, idProvider: $idProvider)';
  }
}