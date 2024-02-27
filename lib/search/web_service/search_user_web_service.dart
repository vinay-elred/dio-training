import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_training/core/dio_client.dart';
import 'package:dio_training/home/model/user_model.dart';

class SearchUserWebService {
  final Dio _dio = DioClient.instance;

  Future<UserModel?> fetchUser(String id) async {
    try {
      final Response response = await _dio.get(
        "users",
        queryParameters: {
          "id": id,
        },
      );
      if (response.statusCode != 200) throw response;
      if (response.data == null) throw response;
      final List data = (response.data);
      return data.map((e) => UserModel.fromMap(e)).toList().first;
    } catch (e) {
      log("Error $e");
      return null;
    }
  }
}
