// ignore_for_file: use_build_context_synchronously

import 'package:dio_training/home/model/user_model.dart';
import 'package:dio_training/home/web_service/home_screen_web_service.dart';
import 'package:flutter/material.dart';

class HomeScreenViewModel with ChangeNotifier {
  final _webService = HomeWebService();
  List<UserModel> _users = [];
  bool _loading = false;

  bool get loading => _loading;
  List<UserModel> get users => List.unmodifiable(_users);

  void fetchUsers() async {
    if (_loading) return;
    _setLoader(true);
    final data = await _webService.fetchUsers();
    if (data == null) return;
    _users = data;
    _setLoader(false);
  }

  void _setLoader(bool val) {
    _loading = val;
    notifyListeners();
  }
}
