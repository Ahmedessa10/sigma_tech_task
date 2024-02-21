import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../manager/user_cubit.dart';

// Widget to build a list of players with add/remove buttons

class BuildPlayerList extends StatefulWidget {
  const BuildPlayerList({super.key});

  @override
  State<BuildPlayerList> createState() => _BuildPlayerListState();
}

final _scrollController = ScrollController();

class _BuildPlayerListState extends State<BuildPlayerList> {
  @override
  void initState() {
    _scrollController.addListener(() {
      print("_scrollController.addListener");
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Fetch more users when reaching the end of the list
        context.read<UserCubit>().fetchMoreUsers();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();

    // Listen for scroll events

    return BlocBuilder<UserCubit, UserState>(
      buildWhen: (previous, current) =>
          current is FilterUserSuccess ||
          current is AddedPlayerSuccess ||
          current is DeletePlayerSuccess ||
          current is GetUserLoaded ||
          current is GetUserLoading,
      builder: (context, state) {
        return Expanded(
          flex: 9,
          child: ListView.builder(
            itemCount: cubit.filterdUsers.length + 1,
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (index < cubit.filterdUsers.length) {
                final user = cubit.filterdUsers[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(user.image),
                  ),
                  title: Text(user.firstName),
                  subtitle: Text(user.email),
                  trailing: buildActionButton(cubit, user),
                );
              } else if (state is GetUserLoading) {
                print("tssssssss");
                print("${cubit.filterdUsers.length}");

                Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        );
      },
    );
  }
}

// Widget to build an action button (Add/Remove) based on player selection
Widget buildActionButton(UserCubit cubit, User user) {
  return cubit.playersList.contains(user)
      ? buildRemoveButton(cubit, user)
      : buildAddButton(cubit, user);
}

// Widget to build a "Remove" button
Widget buildRemoveButton(UserCubit cubit, User user) {
  return MaterialButton(
    elevation: 0,
    padding: EdgeInsets.zero,
    color: Colors.red,
    onPressed: () {
      cubit.deletePlayer(user);
    },
    minWidth: 70,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
    child: Text(
      "Remove",
      style: TextStyle(color: Colors.white),
    ),
  );
}

// Widget to build an "Add" button
Widget buildAddButton(UserCubit cubit, User user) {
  return MaterialButton(
    elevation: 0,
    padding: EdgeInsets.zero,
    color: Colors.deepPurple,
    onPressed: () {
      cubit.addPlayer(user);
    },
    minWidth: 50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
    child: Text(
      "Add",
      style: TextStyle(color: Colors.white),
    ),
  );
}
