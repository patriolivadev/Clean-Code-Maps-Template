import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'suppliers_event.dart';
part 'suppliers_state.dart';

@injectable
class SuppliersBloc extends Bloc<SuppliersEvent, SuppliersState> {
  SuppliersBloc() : super(SuppliersInitial()) {
    on<SuppliersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
