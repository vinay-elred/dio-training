import 'package:dio_training/search/view_model/search_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchUserScreen extends StatelessWidget {
  const SearchUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<SearchUserViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: vm.onChange,
              decoration: InputDecoration(
                  enabledBorder: border,
                  focusedBorder: border,
                  border: border,
                  hintText: "Search by Id"),
            ),
            const SizedBox(height: 50),
            Consumer<SearchUserViewModel>(
              builder: (context, value, child) {
                if (value.loading) return const CircularProgressIndicator();

                if (value.user == null) return const Text("No user found");

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(20),
                  ),
                  child: SizedBox(
                    height: 200,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(value.user?.avatar ?? ""),
                          radius: 35,
                        ),
                        const SizedBox(height: 10),
                        Text(value.user?.name ?? ""),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  InputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    );
  }
}
