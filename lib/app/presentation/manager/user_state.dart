part of 'user_cubit.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class GetUserLoading extends UserState {}

class GetUserLoaded extends UserState {
  final List<User> users;

  GetUserLoaded(this.users);
}

class GetUserFailed extends UserState {
  final String error;

  GetUserFailed(this.error);
}

class FilterUserSuccess extends UserState {
  FilterUserSuccess();
}

class AddedPlayerSuccess extends UserState {
  AddedPlayerSuccess();
}

class DeletePlayerSuccess extends UserState {
  DeletePlayerSuccess();
}
