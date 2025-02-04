import 'package:dio/dio.dart';
import 'package:lottonet/main.dart';

Dio dioInterceptor() {
  final dio = Dio();

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      if(activeToken.isNotEmpty){
      options.headers['Authorization'] = 'Bearer $activeToken';
      }
      return handler.next(options);
    },
    onResponse: (response, handler) {
      return handler.next(response);
    },
    onError: (error, handler) {
      return handler.next(error);
    },
  ));

  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ),
  );

  return dio;
}
