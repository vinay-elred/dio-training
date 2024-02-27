import 'package:dio_training/home/model/user_model.dart';
import 'package:dio_training/home/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserGridBuilder extends StatelessWidget {
  const UserGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeScreenViewModel, List<UserModel>>(
      builder: (context, users, child) {
        if (users.isEmpty) return const Text("No Data");

        return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(20),
                ),
                child: SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                        radius: 35,
                      ),
                      const SizedBox(height: 10),
                      Text(user.name),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
      selector: (p0, p1) => p1.users,
    );
  }
}
