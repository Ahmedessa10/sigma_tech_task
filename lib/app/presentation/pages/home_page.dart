import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user.dart';
import '../manager/user_cubit.dart';
import '../widgets/player_list_widget.dart';
import '../widgets/players_selected_widget.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..fetchUsers(page: 10),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Players'),
        ),
        body: BlocBuilder<UserCubit, UserState>(
          buildWhen: (previous, current) => current is GetUserLoaded,
          builder: (context, state) {
            return UserList();
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(12),
          child: MaterialButton(
            elevation: 0,
            padding: EdgeInsets.zero,
            color: Color(0xFF651FFF),
            onPressed: () {},
            height: 50,
            minWidth: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(
              "Continue",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class UserList extends StatefulWidget {

  UserList();

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();

    return BlocBuilder<UserCubit, UserState>(
      buildWhen: (previous, current) =>
          current is FilterUserSuccess ||
          current is AddedPlayerSuccess ||
          current is DeletePlayerSuccess ||
          current is GetUserLoaded,
      builder: (context, state) {
        return Column(
          children: [
            // Displaying avatars for selected and available players
            const BuildPlayerAvatars(),

            // Search bar for filtering players
            buildSearchBar(cubit),

            // Displaying a list of players with add/remove buttons
            const BuildPlayerList(),
          ],
        );
      },
    );
  }

  // Widget to build a single avatar with a name
  Widget buildAvatar(String imageUrl, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(imageUrl),
          ),
          Text(
            name,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      ),
    );
  }

  // Widget to display avatars for selected players
  Widget buildPlayerAvatarsList(List<User> playersList) {
    return Wrap(
      children: playersList
          .map((user) => buildAvatar(user.image, user.firstName))
          .toList(),
    );
  }

  // Widget to build a search bar
  Widget buildSearchBar(UserCubit cubit) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          cubit.filterList(value);
        },
        decoration: InputDecoration(
          hintText: "Search by player name",
          hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
          labelStyle: TextStyle(color: Colors.blue),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? InkWell(
                  onTap: () {
                    _searchController.clear();
                    cubit.filterList("");
                  },
                  child: Icon(
                    size: 18,
                    Icons.close,
                    color: Colors.blue,
                  ),
                )
              : SizedBox.shrink(),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          labelText: 'Search',
          fillColor: Colors.grey.withOpacity(.2),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
