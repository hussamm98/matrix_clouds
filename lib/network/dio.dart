import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://trscar.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'x-api-key': 'mwDA9w',
          'Content-Language': 'ar',
          'Content-Country': '1',
        }
      ),
    );
  }

  static Future<Response?> getDio({
    required String url,
  }) async {
    return await dio?.get(
      url,
    );
  }
}
