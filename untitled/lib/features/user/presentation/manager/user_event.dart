part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActionGetUser extends UserEvent {
  final NoParams noParams;

  ActionGetUser({required this.noParams});
}
