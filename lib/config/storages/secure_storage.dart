
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'keys.dart';


abstract class BaseAppSecurityData {
  Future<void> saveToken({required String token});

  Future<void> deleteToken();

  Future<String> getToken();

  Future<void> saveParentToken({required String token});

  Future<String> getParentToken();

  Future<void> deleteParentToken();
}

@LazySingleton(as: BaseAppSecurityData)
class AppSecurityData implements BaseAppSecurityData {

  final FlutterSecureStorage secureStorage;

  AppSecurityData({required this.secureStorage});

  @override
  Future<String> getToken() async {
    try {
      final token = await secureStorage.read(key: AppKeys.accessToken);
      print('token is $token');
      return token ?? 'not';
    } catch (e) {
      // Handle error
      return '';
    }
  }

  @override
  Future<String> getParentToken() async {
    try {
      final token = await secureStorage.read(key: AppKeys.accessParentToken);
      return token ?? 'not';
    } catch (e) {
      // Handle error
      return 'error';
    }
  }

  @override
  Future<void> saveParentToken({required String token}) async {
    try {
      await secureStorage.write(
        key: AppKeys.accessParentToken,
        value: token,
      );
    } catch (e) {
      // Handle error
      throw Exception('Failed to save parent token');
    }
  }

  @override
  Future<void> saveToken({required String token}) async {
    try {
      await secureStorage.write(
        key: AppKeys.accessToken,
        value: token,
      );
    } catch (e) {
      // Handle error
      throw Exception('Failed to save token $e');
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      await secureStorage.delete(key: AppKeys.accessToken);
    } catch (e) {
      // Handle error
      throw Exception('Failed to delete token');
    }
  }

  @override
  Future<void> deleteParentToken() async {
    try {
      await secureStorage.delete(key: AppKeys.accessParentToken);
    } catch (e) {
      // Handle error
      throw Exception('Failed to delete parent token');
    }
  }
}