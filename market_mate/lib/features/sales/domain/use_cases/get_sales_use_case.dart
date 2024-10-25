import 'package:core_encode/core_encode.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:market_mate/features/sales/domain/entities/sale.dart';
import 'package:market_mate/features/sales/domain/repositories/sales_repository_base.dart';

@injectable
class GetSalesUseCase extends UseCaseBase<List<Sale>, NoParams> {
  final SalesRepositoryBase repository;

  GetSalesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Sale>>> call(NoParams params) {
    return repository.getSales();
  }
}
