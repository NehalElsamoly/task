import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dio => Dio();
  // @preResolve // = for Future instance
  // Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker => InternetConnectionChecker.instance;

  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage => FlutterSecureStorage();
}