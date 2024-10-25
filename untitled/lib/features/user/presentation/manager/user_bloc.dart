import 'dart:async';
import 'package:core_encode/core_encode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/features/user/domain/entities/user_entity.dart';
import 'package:untitled/features/user/domain/use_cases/get_user_use_case.dart';

part 'user_event.dart';

part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase getUserUseCase;

  UserBloc({required this.getUserUseCase}) : super(UserInitial()) {
    on<ActionGetUser>(_getUser);
  }

  FutureOr<void> _getUser(
    ActionGetUser event,
    Emitter<UserState> emit,
  ) async {
    emit(OnLoading());

    final result = await getUserUseCase(NoParams());

    result.fold(
      (l) => emit(OnGetUserFailure(failure: l)),
      (r) => emit(OnGetUser(user: r)),
    );
  }
}
