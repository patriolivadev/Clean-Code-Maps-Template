import 'dart:async';

import 'package:core_encode/core_encode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:market_mate/features/sales/domain/entities/sale.dart';
import 'package:market_mate/features/sales/domain/use_cases/get_sales_use_case.dart';

part 'sales_event.dart';

part 'sales_state.dart';

@injectable
class SalesBloc extends Bloc<SalesEvent, SalesState> {
  final GetSalesUseCase getSalesUseCase;

  SalesBloc({
    required this.getSalesUseCase,
  }) : super(SalesInitial()) {
    on<ActionGetSales>(_getSales);
  }

  FutureOr<void> _getSales(
    ActionGetSales event,
    Emitter<SalesState> emit,
  ) async {
    emit(OnLoading());
    final result = await getSalesUseCase(NoParams());
    result.fold(
      (l) => emit(OnGetSalesFailure(failure: l)),
      (r) => emit(OnGetSales(sales: r)),
    );
  }
}
