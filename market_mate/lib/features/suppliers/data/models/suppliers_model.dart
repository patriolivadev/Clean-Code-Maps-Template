import 'package:market_mate/features/suppliers/domain/entities/supplier.dart';

class SupplierModel extends Supplier {
  SupplierModel({
    required super.id,
    required super.name,
    required super.phoneNumber,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
    };
  }
}
