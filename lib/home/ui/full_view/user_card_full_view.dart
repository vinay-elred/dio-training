import 'package:dio_training/home/model/user_model.dart';
import 'package:flutter/material.dart';

class UserCardFullView extends StatelessWidget {
  const UserCardFullView({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        child: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
                radius: 35,
              ),
              const SizedBox(height: 40),
              Text(user.name),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
