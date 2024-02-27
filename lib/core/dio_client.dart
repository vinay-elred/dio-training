import 'package:dio/dio.dart';

class DioClient {
  const DioClient._();
  static final instance = Dio(
    BaseOptions(
      baseUrl: "https://65dd6acde7edadead7eddeb2.mockapi.io/",
    ),
  );
}
