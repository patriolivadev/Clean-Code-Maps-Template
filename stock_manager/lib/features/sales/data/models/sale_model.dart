import 'package:stock_manager/features/sales/domain/entities/sale.dart';

class SaleModel extends Sale {
  SaleModel({
    required String id,
    required List<String> products,
    required DateTime date,
    required double totalPrice,
  }) : super(
    id: id,
    products: products,
    date: date,
    totalPrice: totalPrice,
  );

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products,
      'date': date.toIso8601String(),
      'total_price': totalPrice,
    };
  }
}
