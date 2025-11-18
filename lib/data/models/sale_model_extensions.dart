import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../../domain/entities/sale.dart' as domain;

extension SaleModelExtensions on SaleModel {
  domain.Sale toDomain() {
    return domain.Sale(
      idSale: idSale,
      idEmployee: idEmployee,
      idProduct: idProduct,
      amount: amount,
      idClient: idClient,
      subtotal: subtotal,
      total: total,
      cashDiscount: cashDiscount,
    );
  }
}

extension DomainSaleExtensions on domain.Sale {
  SaleModelsCompanion toCompanion() {
    return SaleModelsCompanion(
      idSale: idSale != null ? Value(idSale!) : const Value.absent(),
      idEmployee: Value(idEmployee),
      idProduct: Value(idProduct),
      amount: Value(amount),
      idClient: Value(idClient),
      subtotal: Value(subtotal),
      total: Value(total),
      cashDiscount: Value(cashDiscount),
    );
  }

  SaleModel toModel() {
    return SaleModel(
      idSale: idSale ?? 0,
      idEmployee: idEmployee,
      idProduct: idProduct,
      amount: amount,
      idClient: idClient,
      subtotal: subtotal,
      total: total,
      cashDiscount: cashDiscount,
    );
  }
}