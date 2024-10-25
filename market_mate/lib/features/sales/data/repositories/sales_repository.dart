
import 'package:core_encode/core_encode.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:market_mate/features/sales/domain/entities/sale.dart';
import 'package:market_mate/features/sales/domain/repositories/sales_repository_base.dart';

@Injectable(as: SalesRepositoryBase)
class SalesRepository extends SalesRepositoryBase{
  SalesRepository({required super.remote});

  @override
  Future<Either<Failure, List<Sale>>> getSales() async {
    try {
      List<Sale> sales = await remote.getSales();
      return Right(sales);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnhandledFailure(message: '$e'));
    }
  }
}