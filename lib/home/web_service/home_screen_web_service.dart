import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_training/home/model/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeWebService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://65dd6acde7edadead7eddeb2.mockapi.io/",
    ),
  );

  Future<List<UserModel>?> fetchUsers() async {
    try {
      final Response response = await _dio.get("allUsers");
      if (response.statusCode != 200) throw response;
      if (response.data == null) throw response;
      final List data = (response.data);
      return await compute(_parseData, data);
    } catch (e) {
      log("Error $e");
      return null;
    }
  }
}

// Top level func
List<UserModel> _parseData(List data) {
  return data.map((e) => UserModel.fromMap(e)).toList();
}
