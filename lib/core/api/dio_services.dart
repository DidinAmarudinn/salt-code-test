import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:salt_code_test/core/constants/environment.dart';

Dio dioServices() {
  Dio dio = Dio(BaseOptions(baseUrl: Environment.baseUrl));
  

  InterceptorsWrapper getInterceptor() {
    var logger = Logger(
      printer: PrettyPrinter(
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
    );
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers = {
          'Content-Type': options.data is FormData
              ? 'multipart/form-data'
              : Headers.jsonContentType,
          'Accept': 'application/json',
        };
        final params =  options.queryParameters;
        params["apiKey"] = Environment.apiKey;
        options.queryParameters = params;
        logger.i('--> ${options.method} ${options.uri}');
        logger.i('Headers: ${options.headers}');
        logger.i('Body: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        logger.i(
            '<-- ${response.statusCode} ${response.statusMessage} ${response.requestOptions.uri}');
        logger.i('Headers: ${response.headers}');
        logger.i('Body: ${response.data}');
        return handler.next(response);
      },
      onError: (err, handler) async {
        logger.i(
            '<-- ${err.response?.statusCode} ${err.response?.statusMessage} ${err.response?.requestOptions.uri}');
        logger.i('Headers: ${err.response?.headers}');
        logger.i('Error: ${err.response?.data}');
        return handler.next(err);
      },
    );
  }

  dio.interceptors.add(getInterceptor());
  return dio;
}
