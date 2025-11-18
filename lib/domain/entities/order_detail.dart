import 'package:equatable/equatable.dart';

class OrderDetail extends Equatable {
  final int? idDetail;
  final int idOrder;
  final int amount;

  const OrderDetail({
    this.idDetail,
    required this.idOrder,
    required this.amount,
  });

  OrderDetail copyWith({
    int? idDetail,
    int? idOrder,
    int? amount,
  }) {
    return OrderDetail(
      idDetail: idDetail ?? this.idDetail,
      idOrder: idOrder ?? this.idOrder,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object?> get props => [
        idDetail,
        idOrder,
        amount,
      ];

  @override
  String toString() {
    return 'OrderDetail(idDetail: $idDetail, idOrder: $idOrder, amount: $amount)';
  }
}