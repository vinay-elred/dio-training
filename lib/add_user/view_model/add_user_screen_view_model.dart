// ignore_for_file: use_build_context_synchronously

import 'package:dio_training/add_user/model/add_user_model.dart';
import 'package:dio_training/add_user/web_service/add_user_screen_web_service.dart';
import 'package:dio_training/home/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddUserScreenViewModel with ChangeNotifier {
  final _webService = AddUserWebService();
  final nameController = TextEditingController();
  final avatarController = TextEditingController();
  bool _loading = false;

  bool get loading => _loading;

  void addUser(BuildContext context) async {
    _setLoader(true);
    final user = AddUserModel(
      name: nameController.text.trim(),
      createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
      avatar: avatarController.text.trim(),
    );
    final data = await _webService.addUsers(user);

    if (data == null) {
      Fluttertoast.showToast(msg: "Post failed");
    } else {
      context.read<HomeScreenViewModel>().fetchUsers();
      Navigator.pop(context);
    }
    _setLoader(false);
  }

  void _setLoader(bool val) {
    _loading = val;
    notifyListeners();
  }

  @override
  void dispose() {
    avatarController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
