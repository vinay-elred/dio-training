import 'package:dio_training/add_user/view_model/add_user_screen_view_model.dart';
import 'package:dio_training/search/view_model/search_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AddUserScreenViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Add User"),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: vm.nameController,
                decoration: InputDecoration(
                    enabledBorder: border,
                    focusedBorder: border,
                    border: border,
                    hintText: "Full Name"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: vm.avatarController,
                decoration: InputDecoration(
                    enabledBorder: border,
                    focusedBorder: border,
                    border: border,
                    hintText: "Url"),
              ),
              const SizedBox(height: 50),
              Selector<AddUserScreenViewModel, bool>(
                builder: (context, loading, child) {
                  if (loading) return const CircularProgressIndicator();
                  return ElevatedButton(
                    onPressed:() => vm.addUser(context),
                    child: const Text("Post Data"),
                  );
                },
                selector: (p0, p1) => p1.loading,
              ),
            ],
          ),
        ));
  }

  InputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    );
  }
}
