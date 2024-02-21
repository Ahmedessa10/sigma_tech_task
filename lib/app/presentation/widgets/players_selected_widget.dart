import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user.dart';
import '../manager/user_cubit.dart';

class BuildPlayerAvatars extends StatelessWidget {
  const BuildPlayerAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();

    return BlocBuilder<UserCubit, UserState>(
      buildWhen: (previous, current) =>
          current is AddedPlayerSuccess || current is DeletePlayerSuccess,
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Displaying avatar for a test account
              const Column(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                        "https://robohash.org/Terrence.png?set=set4"),
                  ),
                  Text(
                    "test account",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),

              // Displaying avatars for selected players
              buildPlayerAvatarsList(cubit.playersList, context),

              // Displaying empty avatars for adding new players
              buildEmptyAvatars(10),
            ],
          ),
        );
      },
    );
  }
}

// Widget to display avatars for selected and available players
Widget buildAvatar(User user, bool fixed, BuildContext context) {
  final cubit = context.read<UserCubit>();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
         Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(user.image),
                  ),
                  Positioned(
                      right: -2,
                      top: -5,
                      child: InkWell(
                        onTap: () {
                          cubit.deletePlayer(user);
                        },
                        child: const CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            size: 12,
                            color: Colors.red,
                          ),
                        ),
                      ))
                ],
              ),
        Text(
            user.firstName,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        )
      ],
    ),
  );
}

// Widget to display avatars for selected players
Widget buildPlayerAvatarsList(List<User> playersList, BuildContext context) {
  return Wrap(
    children:
        playersList.map((user) => buildAvatar(user, false, context)).toList(),
  );
}

// Widget to display empty avatars for adding new players
Widget buildEmptyAvatars(int count) {
  return Wrap(
    children: List.generate(
      count,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: const Icon(Icons.person_add_alt),
            ),
            const Text(""),
          ],
        ),
      ),
    ),
  );
}
