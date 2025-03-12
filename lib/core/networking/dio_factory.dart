import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

class DioFactory {
  const DioFactory._();
  static Dio? _dio;

  static Dio get instance {
    if (_dio != null) return _dio!;

    _dio =
        Dio()
          ..options.baseUrl = ApiConstants.baseUrl
          ..options.connectTimeout = const Duration(seconds: 30)
          ..options.receiveTimeout = const Duration(seconds: 30)
          ..interceptors.addAll([
            if (kDebugMode)
              PrettyDioLogger(
                requestBody: true,
                requestHeader: true,
                responseHeader: true,
                responseBody: true,
                error: true,
              ),
            _getAuthorizationInterceptor(),
          ]);
    return _dio!;
  }

  static InterceptorsWrapper _getAuthorizationInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll({
          if (ApiConstants.apiKey != null)
            'Authorization': 'Bearer ${ApiConstants.apiKey}',
        });

        return handler.next(options);
      },
    );
  }
}
