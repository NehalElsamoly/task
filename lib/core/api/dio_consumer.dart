import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../config/routes/routes_names.dart';
import '../../config/storages/secure_storage.dart';
import '../../my_app/app_reference.dart';
import '../../my_app/my_app.dart';
import '../exceptions/exceptions.dart';
import '../services/services_locator.dart';
import 'api_consumer.dart';
import 'end_points.dart';
import 'interceptors.dart';

@LazySingleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..connectTimeout = const Duration(minutes: 1)
      ..headers = {
        contentType: applicationJson,
        accept: applicationJson,
      }
      ..followRedirects = false
      ..validateStatus = (status) => status != null && status < 500;

    client.interceptors.add(AppInterceptors());
    if (kDebugMode) {
      client.interceptors.add(LogInterceptor());
    }
  }

  String applicationJson = 'application/json';
  String contentType = 'content-type';
  String accept = 'accept';
  String authorization = 'authorization';
  String defaultLanguage = 'language';

  @override
  Future get(String path, {Options? options}) async {
    try {
      final response = await client.get(
        path,
        options: options ??
            Options(
              headers: {
                'Content-Type': applicationJson,
                'Accept': applicationJson,
              },
            ),
      );
      return response;
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  @override
  Future post(String path,
      {Options? options,
        Map<String, dynamic>? queryParameters,
        Object? body}) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
        options: options ??
            Options(headers: {
              'Authorization':
              'Bearer ${await getIt<BaseAppSecurityData>().getToken() ?? ''}',
            }),
      );
      if (response.statusCode == 401) {
        await getIt<BaseAppSecurityData>().deleteToken();
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(AppRoutesNames.rLoginScreen, (route) => false);
      } else {
        return response;
      }
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  @override
  Future postDataBackParent(String path,
      {Options? options,
        Map<String, dynamic>? queryParameters,
        Object? body}) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
        options: options ??
            Options(headers: {
              'Authorization':
              'Bearer ${await getIt<BaseAppSecurityData>().getParentToken() ?? ''}',
            }),
      );
      if (response.statusCode == 401) {
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(AppRoutesNames.rLoginScreen, (route) => false);
      } else {
        return response;
      }
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  @override
  Future publicPost(String path,
      {Options? options,
        Map<String, dynamic>? queryParameters,
        Object? body}) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
        options: options ??
            Options(headers: {
              'Content-Type': applicationJson,
              'Accept': applicationJson,
            }),
      );
      if (response.statusCode == 401) {
        await getIt<BaseAppSecurityData>().deleteToken();
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(AppRoutesNames.rLoginScreen, (route) => false);
      } else {
        return response;
      }
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  @override
  Future download(String url,
      {required dynamic savePath,
        ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await client.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  DioExceptionType? _handleError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        throw const ServerException(message: 'Timeout while connecting to server');
      case DioExceptionType.sendTimeout:
        throw const ServerException(message: 'Timeout while sending request to server');
      case DioExceptionType.receiveTimeout:
        throw const ServerException(message: 'Timeout while receiving data from server');
      case DioExceptionType.badCertificate:
        throw const ServerException(message: 'Bad SSL certificate from server');
      case DioExceptionType.badResponse:
        if (dioError.response?.statusCode == 401 ||
            dioError.response?.statusCode == 403) {
          AppReference.navigatorKey.currentState?.pushNamedAndRemoveUntil(
              AppRoutesNames.rLoginScreen, (route) => false);
        }
        throw const ServerException(message: 'Server returned an error');
      case DioExceptionType.cancel:
        throw const ServerException(message: 'Request was cancelled');
      case DioExceptionType.connectionError:
        throw const ServerException(message: 'No internet connection');
      case DioExceptionType.unknown:
        throw const ServerException(message: 'Unknown error occurred');
    }
  }
}
