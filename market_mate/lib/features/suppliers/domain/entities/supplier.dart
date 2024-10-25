import 'package:core_encode/core_encode.dart';

abstract class Supplier extends Entity {
  final String id;
  final String name;
  final String? phoneNumber;

  Supplier({
    required this.id,
    required this.name,
    required this.phoneNumber
  });
}