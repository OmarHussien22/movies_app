import 'package:dio/dio.dart';

//Todo : internet permission
// <uses-permission android:name="android.permission.INTERNET"/>
class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/',
        receiveDataWhenStatusError: true,
        followRedirects: true,
        validateStatus: (status) {
          return status! <= 500;
        },
      ),
    );
  }

  static Future<Response> getData({required String url}) async {
    return await _dio.get(url);
  }

  static Future<Response> getVideos({required videosId}) async {
    return await _dio.get(
        'https://api.themoviedb.org/3/movie/$videosId/videos?api_key=837aa67b269303622a476bbe24283a57');
  }
}
