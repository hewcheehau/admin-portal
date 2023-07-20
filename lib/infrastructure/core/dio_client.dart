import 'package:dio/dio.dart';

import 'dio_response.dart';

class DioClient {
  final _dio = Dio();
  DioClient._();

  DioClient.init(String baseUrl) {
    _dio.options
      ..baseUrl = baseUrl
      ..sendTimeout = const Duration(milliseconds: 25000)
      ..receiveTimeout = const Duration(milliseconds: 25000)
      ..connectTimeout = const Duration(milliseconds: 25000);
  }

  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  Future<DioResponse> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return SuccessResponse(response: response);
    } catch (e) {
      rethrow;
    }
  }

  Future<DioResponse> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return SuccessResponse(response: response, url: url);
    } catch (e) {
      rethrow;
    }
  }
}
