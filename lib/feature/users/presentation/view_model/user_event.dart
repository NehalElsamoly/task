part of 'user_bloc.dart';

abstract class UserEvent {}

class LoadUsersEvent extends UserEvent {
  final int page;

  LoadUsersEvent(this.page);
}

class LoadUserDetailsEvent extends UserEvent {
  final int id;

  LoadUserDetailsEvent(this.id);
}
