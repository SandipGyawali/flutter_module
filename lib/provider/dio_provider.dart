import 'package:dio/dio.dart';

class DioProvider {
  static final _dio = Dio(
    BaseOptions(
      validateStatus: (status) => status! < 505,
    ),
  );

  static get dio => _dio;
}
