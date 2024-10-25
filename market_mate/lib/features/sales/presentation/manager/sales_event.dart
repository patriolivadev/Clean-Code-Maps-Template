part of 'sales_bloc.dart';

@immutable
abstract class SalesEvent {}

class ActionGetSales extends SalesEvent {
  final NoParams noParams;

  ActionGetSales({required this.noParams});
}
