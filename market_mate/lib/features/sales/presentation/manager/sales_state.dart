part of 'sales_bloc.dart';

@immutable
abstract class SalesState {}

class SalesInitial extends SalesState {}

class OnLoading extends SalesState {}

class OnGetSales extends SalesState {
  final List<Sale> sales;

  OnGetSales({required this.sales});
}

class OnGetSalesFailure extends SalesState {
  final Failure failure;

  OnGetSalesFailure({required this.failure});
}

