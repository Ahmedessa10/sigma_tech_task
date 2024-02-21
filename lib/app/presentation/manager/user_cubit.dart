// user_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/service_locator/sl.dart';
import '../../domain/entities/user.dart';
import '../../domain/use_cases/get_user_usecase.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  List<User> users = [];
  List<User> filterdUsers = [];

  Future<void> fetchUsers({int page = 10}) async {
    print("_scrollController .fetchUsers");
    filterdUsers.clear();
    users.clear();
    emit(GetUserLoading());
    (await sl<GetUserUseCase>().call(page)).fold(
      (l) {
        emit(GetUserFailed(l.message));
      },
      (r) {
        users = r;
        filterdUsers = r;
        emit(GetUserLoaded(r));
      },
    );
  }

  int currentPage = 10; // Track the current page

  // Fetch more users for pagination
  Future<void> fetchMoreUsers() async {
    print("tssssssss $currentPage ");
    emit(GetUserLoading());
    (await sl<GetUserUseCase>().call(currentPage)).fold(
          (l) {
        emit(GetUserFailed(l.message));
      },
          (r) {
        // Append new users to the existing list
        users = r;
        filterdUsers = r;
        currentPage+=10;
        emit(GetUserLoaded(users));
      },
    );
  }

  void filterList(String query) {
    filterdUsers = users
        .where((item) =>
            item.firstName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(FilterUserSuccess());
  }

  List<User> playersList = [];

  void addPlayer(User user) {
    playersList.add(user);

    emit(AddedPlayerSuccess());
  }

  void deletePlayer(User user) {
    playersList.remove(user);
    emit(DeletePlayerSuccess());
  }
}
