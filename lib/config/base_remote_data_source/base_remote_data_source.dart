import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_consumer.dart';
import '../../core/api/network_info.dart';
import '../../core/exceptions/exceptions.dart';

abstract class BaseRemoteDataSource {
  Future<Map<String, dynamic>> postData({
    required String url,
    required Object body,
  });

  Future<Map<String, dynamic>> publicPostData({
    required String url,
    required Object body,
  });

  Future<Map<String, dynamic>> get({
    required String url,
    Options? options,
    bool requiresAuth = true,
  });
}

@LazySingleton(as: BaseRemoteDataSource)
class BaseRemoteDataSourceImpl implements BaseRemoteDataSource {
  final ApiConsumer apiConsumer;
  final NetworkInfo networkInfo;

  BaseRemoteDataSourceImpl({
    required this.apiConsumer,
    required this.networkInfo,
  });

  @override
  Future<Map<String, dynamic>> postData({
    required String url,
    required Object body,
  }) async {
    if (!await networkInfo.isConnected) {
      throw const NoInternetConnectionException();
    }

    final rawResponse = await apiConsumer.post(url, body: body);

    if (rawResponse == null) {
      throw ServerException(message: "No response from server or token missing");
    }

    return _checkStatusCode(rawResponse);
  }

  @override
  Future<Map<String, dynamic>> publicPostData({
    required String url,
    required Object body,
  }) async {
    if (!await networkInfo.isConnected) {
      throw const NoInternetConnectionException();
    }

    final response = await apiConsumer.publicPost(url, body: body);
    return _checkStatusCode(response);
  }

  @override
  Future<Map<String, dynamic>> get({
    required String url,
    Options? options,
    bool requiresAuth = true,
  }) async {
    if (!await networkInfo.isConnected) {
      throw const NoInternetConnectionException();
    }

    final defaultHeaders = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final finalOptions = requiresAuth
        ? options
        : Options(headers: defaultHeaders);

    final response = await apiConsumer.get(url, options: finalOptions);
    return _checkStringStatusCode(response);
  }

  Future<Map<String, dynamic>> _checkStatusCode(Response response) async {
    dynamic data = response.data;

    if (data is String) {
      try {
        data = jsonDecode(data);
      } catch (_) {
        throw ServerException(message: 'Failed to parse server response');
      }
    }

    if (data is! Map<String, dynamic>) {
      throw ServerException(message: 'Unexpected server response');
    }

    if (response.statusCode != 200) {
      throw ServerException(message: data['message'] ?? 'Error occurred');
    }

    if (data['status'] == false) {
      throw ServerException(message: data['message'] ?? 'Operation failed');
    }

    return data;
  }

  Future<Map<String, dynamic>> _checkStringStatusCode(Response response) async {
    dynamic data = response.data;

    if (data is String) {
      try {
        data = jsonDecode(data);
      } catch (_) {
        throw ServerException(message: 'Failed to parse string response');
      }
    }

    if (data is! Map<String, dynamic>) {
      throw ServerException(message: 'Unexpected string response');
    }

    if (response.statusCode != 200) {
      throw ServerException(message: data['message'] ?? 'Error occurred');
    }

    // Allow non-strict `status` checking for public APIs like reqres.in
    return data;
  }
}
