part of 'api_error_handler.dart';

// DO NOT edit enum DataSource values without as it's based DioExceptionType values
enum DataSource {
  noContent,
  badRequest,
  unAuthorized,
  forbidden,
  internalServerError,
  notFound,
  apiLogicError,
  serverFailure,
  badGateway,

  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  parsingError,

  defaultError
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() => _errorsData[this]!;
}

final _errorsData = <DataSource, ApiErrorModel>{
  DataSource.noContent: const ApiErrorModel(code: 201, message: 'No Content'),
  DataSource.badRequest: const ApiErrorModel(code: 400, message: 'Bad Request'),

  DataSource.unAuthorized:
      const ApiErrorModel(code: 401, message: 'UnAuthorized'),

  DataSource.forbidden: const ApiErrorModel(code: 403, message: 'Forbidden'),
  DataSource.notFound: const ApiErrorModel(code: 404, message: 'Not Found'),

  DataSource.internalServerError:
      const ApiErrorModel(code: 500, message: 'Internal Server Error'),
  DataSource.serverFailure:
      const ApiErrorModel(code: 502, message: 'Server Failure'),
  DataSource.badGateway: const ApiErrorModel(
      code: 503, message: 'Service Temporarily Unavailable'),

  DataSource.apiLogicError:
      const ApiErrorModel(code: 422, message: 'Api Logic Error'),

  DataSource.connectionTimeout:
      const ApiErrorModel(code: -1, message: 'Connection Timeout'),

  DataSource.cancel: const ApiErrorModel(code: -2, message: 'Cancel'),

  DataSource.receiveTimeout:
      const ApiErrorModel(code: -3, message: 'Recieve Timeout'),

  DataSource.sendTimeout:
      const ApiErrorModel(code: -4, message: 'Send Timeout'),

  DataSource.cacheError: const ApiErrorModel(code: -5, message: 'Cache Error'),

  DataSource.noInternetConnection:
      const ApiErrorModel(code: -6, message: 'No Internet Connection'),
  DataSource.parsingError:
      const ApiErrorModel(code: -7, message: 'Parsing Error'),

  DataSource.defaultError:
      const ApiErrorModel(code: -8, message: 'Something went wrong'),

  // Add your custom errors here
};
