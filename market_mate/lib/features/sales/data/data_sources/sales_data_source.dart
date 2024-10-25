import 'package:injectable/injectable.dart';
import 'package:market_mate/core/services/firestore_service.dart';
import 'package:market_mate/features/sales/data/models/sale_model.dart';
import 'package:market_mate/features/sales/domain/entities/sale.dart';

abstract class SalesRemoteDataSourceBase {
  final FirestoreServiceBase firestoreService;

  SalesRemoteDataSourceBase({
    required this.firestoreService,
  });

  Future<List<Sale>> getSales();
}

@Injectable(as: SalesRemoteDataSourceBase)
class SalesRemoteDataSource extends SalesRemoteDataSourceBase {
  SalesRemoteDataSource({
    required super.firestoreService,
  });

  static const salesKey = 'sales';

  @override
  Future<List<Sale>> getSales() async {
    final result = await firestoreService.getAll(collection: salesKey);
    print(result[0].toString());
    List<Sale> sales = result.map((item) => SaleModel.fromJson(map: item)).toList();

    return sales;
  }



}
