import 'package:core_encode/core_encode.dart';
import 'package:market_mate/features/sales/data/data_sources/sales_data_source.dart';
import 'package:market_mate/features/sales/domain/entities/sale.dart';
import 'package:dartz/dartz.dart';

abstract class SalesRepositoryBase {
  final SalesRemoteDataSourceBase remote;

  SalesRepositoryBase({required this.remote});

  Future<Either<Failure, List<Sale>>> getSales();
}
