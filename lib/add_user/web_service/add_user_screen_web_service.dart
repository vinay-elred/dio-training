import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_training/add_user/model/add_user_model.dart';
import 'package:dio_training/core/dio_client.dart';
import 'package:dio_training/home/model/user_model.dart';

class AddUserWebService {
  final Dio _dio = DioClient.instance;

  Future<UserModel?> addUsers(AddUserModel user) async {
    try {
      final Response response = await _dio.post(
        "users",
        data: user.toMap(),
      );
      if (response.statusCode != 201) throw response;
      if (response.data == null) throw response;
      return UserModel.fromMap(response.data);
    } catch (e) {
      log("Error $e");
      return null;
    }
  }
}
