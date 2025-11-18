import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final int? customerId;
  final String name;
  final String lastName;
  final String nit;

  const Customer({
    this.customerId,
    required this.name,
    required this.lastName,
    required this.nit,
  });

  Customer copyWith({
    int? customerId,
    String? name,
    String? lastName,
    String? nit,
  }) {
    return Customer(
      customerId: customerId ?? this.customerId,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      nit: nit ?? this.nit,
    );
  }

  @override
  List<Object?> get props => [
        customerId,
        name,
        lastName,
        nit,
      ];

  @override
  String toString() {
    return 'Customer(customerId: $customerId, name: $name, lastName: $lastName, nit: $nit)';
  }
}