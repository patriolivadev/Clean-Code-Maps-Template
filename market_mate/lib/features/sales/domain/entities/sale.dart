import 'package:core_encode/core_encode.dart';

abstract class Sale extends Entity {
  final String id;
  final List<dynamic> productsIds;
  final DateTime date;
  final double totalPrice;

  Sale({
    required this.id,
    required this.productsIds,
    required this.date,
    required this.totalPrice,
  });
}
