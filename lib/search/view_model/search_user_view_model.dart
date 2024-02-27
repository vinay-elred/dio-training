import 'dart:async';

import 'package:dio_training/home/model/user_model.dart';
import 'package:dio_training/search/web_service/search_user_web_service.dart';
import 'package:flutter/widgets.dart';

class SearchUserViewModel with ChangeNotifier {
  final _webservice = SearchUserWebService();
  Timer? _debouncer;
  UserModel? _userModel;
  bool _loading = false;

  UserModel? get user => _userModel;
  bool get loading => _loading;

  void onChange(String value) {
    final searchKey = value.trim();
    if (searchKey.isEmpty) {
      return _resetDebounce();
    }
    if (_debouncer?.isActive ?? false) {
      _debouncer?.cancel();
      _loading = true;
      notifyListeners();
    }
    _debouncer = Timer(
      const Duration(milliseconds: 300),
      () async {
        _loading = true;
        notifyListeners();
        _userModel = await _webservice.fetchUser(searchKey);
        _loading = false;
        notifyListeners();
      },
    );
  }

  void _resetDebounce() {
    _debouncer?.cancel();
    _userModel = null;
    _loading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _debouncer?.cancel();
    super.dispose();
  }
}
