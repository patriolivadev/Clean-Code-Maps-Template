import 'package:stock_manager/features/suppliers/domain/entities/supplier.dart';

class SupplierModel extends Supplier {
  SupplierModel({
    required id,
    required name,
    required phoneNumber,
  }) : super(id: id, name: name, phoneNumber: phoneNumber);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
    };
  }
}
