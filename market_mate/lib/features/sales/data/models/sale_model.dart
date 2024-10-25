import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market_mate/features/sales/domain/entities/sale.dart';

class SaleModel extends Sale {
  SaleModel({
    required super.id,
    required super.productsIds,
    required super.date,
    required super.totalPrice,
  });

  factory SaleModel.fromJson({required Map<String, dynamic> map}) {
    return SaleModel(
      id: map['id'] ?? '0',
      productsIds: map['productsIds'] ?? [],
      date: map['date'] is Timestamp
          ? (map['date'] as Timestamp).toDate()
          : (map['date'] ?? DateTime.now()),
      totalPrice: (map['totalPrice'] ?? 0).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': productsIds,
      'date': date.toIso8601String(),
      'total_price': totalPrice,
    };
  }
}
