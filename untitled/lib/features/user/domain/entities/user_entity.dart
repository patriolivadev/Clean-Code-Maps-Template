import 'package:core_encode/core_encode.dart';

abstract class User extends Entity {
  final String name;
  final String lastName;

  User({
    required this.name,
    required this.lastName,
  });
}
