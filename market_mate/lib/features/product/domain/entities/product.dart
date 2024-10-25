import 'package:core_encode/core_encode.dart';

abstract class Product extends Entity {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> suppliers;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.suppliers,
  });
}
