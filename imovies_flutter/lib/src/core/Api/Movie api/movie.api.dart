import 'package:dio/dio.dart';
import 'package:imovies_flutter/src/core/Api/interceptors/interceptor.dart';
import 'dart:isolate';
 
// Top-level function to be used with Isolate.run()
Future<Response<Map<String, dynamic>>?> fetchFromApi(
    String url, Map<String, dynamic> headers) async {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    headers: headers,
  ));
  dio.interceptors.add(LogManagerInterceptor());
  try {
    return await dio.get<Map<String, dynamic>>(url);
  } on DioException catch (e) {
    print('Dio error: ${e.message}');
    return null;
  }
}

class MoviesApiService {
  final Dio dio;
  final Map<String, dynamic> headers;

  MoviesApiService()
      : dio = Dio(BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3',
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZWJlZGNmNTE5YzlhZDA4YWQ3MGU1MWY4YWFhM2MxNSIsInN1YiI6IjY1OTc0ZmJmZWEzN2UwMDZmYTRkMDlhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ERY6EDeSdog4MhB5Ix3B7VZVBbn1ELDdb0WYLiHvQ9c',
            'accept': 'application/json'
          },
        )),
        headers = {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZWJlZGNmNTE5YzlhZDA4YWQ3MGU1MWY4YWFhM2MxNSIsInN1YiI6IjY1OTc0ZmJmZWEzN2UwMDZmYTRkMDlhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ERY6EDeSdog4MhB5Ix3B7VZVBbn1ELDdb0WYLiHvQ9c',
          'accept': 'application/json'
        } {
    dio.interceptors.add(LogManagerInterceptor());
    // Optionally add PrettyDioLogger if needed.
    // dio.interceptors.add(PrettyDioLogger(
    //     requestHeader: false,
    //     requestBody: false,
    //     responseBody: true,
    //     responseHeader: true,
    //     error: true,
    //     compact: true,
    //     maxWidth: 90));
  }

  Future<Response?> call(String url) async {
    try {
      final response = await Isolate.run(() => fetchFromApi(url, headers));
      if (response != null && response.statusCode == 200) {
        return response;
      } else {
        return null;
      }
    } on DioException catch (DioException) {
      // Handle Dio specific exceptions here
      print('Dio error: ${DioException.message}');
      return null;
    } catch (e) {
      // Handle other exceptions
      print('General error: $e');
      return null;
    }
  }
}


