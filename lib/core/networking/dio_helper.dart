import 'package:dio/dio.dart';

import 'api_request_model.dart';

abstract class ApiHelper {
  Future<Response> getData(ApiRequestModel apiRequestModel);
  Future<Response> postData(ApiRequestModel apiRequestModel);
  Future<Response> deleteData(ApiRequestModel apiRequestModel);
  Future<Response> patchData(ApiRequestModel apiRequestModel);
}

class DioHelperImpl implements ApiHelper {
  final Dio _dio;
  const DioHelperImpl(this._dio);

  @override
  Future<Response> getData(ApiRequestModel apiRequestModel) async {
    final response = await _dio.get(
      apiRequestModel.endPoint,
      queryParameters: apiRequestModel.queries,
      data: apiRequestModel.body,
      options: Options(
        headers: apiRequestModel.headers,
        responseType: apiRequestModel.responseType,
      ),
    );
    return response;
  }

  @override
  Future<Response> postData(ApiRequestModel apiRequestModel) async {
    final response = await _dio.post(
      apiRequestModel.endPoint,
      queryParameters: apiRequestModel.queries,
      data: apiRequestModel.body,
      options: Options(
        headers: apiRequestModel.headers,
        responseType: apiRequestModel.responseType,
      ),
    );
    return response;
  }

  @override
  Future<Response> deleteData(ApiRequestModel apiRequestModel) async {
    final response = await _dio.delete(
      apiRequestModel.endPoint,
      queryParameters: apiRequestModel.queries,
      data: apiRequestModel.body,
      options: Options(
        headers: apiRequestModel.headers,
        responseType: apiRequestModel.responseType,
      ),
    );
    return response;
  }

  @override
  Future<Response> patchData(ApiRequestModel apiRequestModel) async {
    final response = await _dio.patch(
      apiRequestModel.endPoint,
      queryParameters: apiRequestModel.queries,
      data: apiRequestModel.body,
      options: Options(
        headers: apiRequestModel.headers,
        responseType: apiRequestModel.responseType,
      ),
    );
    return response;
  }
}
