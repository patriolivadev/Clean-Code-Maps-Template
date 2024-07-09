import 'package:core_encode/core_encode.dart';

abstract class Sale extends Entity {
  final String id;
  final List<String> products;
  final DateTime date;
  final double totalPrice;

  Sale({
    required this.id,
    required this.products,
    required this.date,
    required this.totalPrice,
  });
}
