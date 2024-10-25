part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class OnLoading extends UserState {}

class OnGetUser extends UserState {
  final User user;

  OnGetUser({required this.user});
}

class OnGetUserFailure extends UserState {
  final Failure failure;

  OnGetUserFailure({required this.failure});
}
