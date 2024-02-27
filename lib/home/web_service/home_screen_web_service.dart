import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_training/home/model/user_model.dart';

class HomeWebService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://65dd6acde7edadead7eddeb2.mockapi.io/",
    ),
  );

  Future<List<UserModel>?> fetchUsers() async {
    try {
      final Response response = await _dio.get("users");
      if (response.statusCode != 200) throw response;
      if (response.data == null) throw response;
      final List data = (response.data);
      return data.map((e) => UserModel.fromMap(e)).toList();
    } catch (e) {
      log("Error $e");
      return null;
    }
  }
}
