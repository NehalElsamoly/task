import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

import '../config/resources/app_constants.dart';
import '../config/storages/keys.dart';
import '../core/services/services_locator.dart';

class AppReference {
  AppReference._();

  static final AppReference _instance = AppReference._();

  static AppReference get instance => _instance;

  static late bool deviceIsAndroid;
  static bool deviceIsTablet = false;
  static late bool deviceIsIos;
  static late ThemeData themeData;
  static final deviceInfoPlugin = DeviceInfoPlugin();
  static final GlobalKey<NavigatorState> _navigatorKey =
  GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static Orientation currentOrientation(context) => MediaQuery.of(context).orientation;

  static bool isPortrait(context) => MediaQuery.of(context).orientation == Orientation.portrait;
  static bool isLandScape(context) => MediaQuery.of(context).orientation == Orientation.landscape;

  static double deviceHeight(context) =>
      MediaQuery.sizeOf(context).height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom-AppConstants.appPaddingR7-AppConstants.appPaddingR20
  ;

  //ToDo: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  static double deviceWidth(context) => MediaQuery.sizeOf(context).width-MediaQuery.of(context).padding.right -MediaQuery.of(context).padding.left -AppConstants.appPaddingR7-AppConstants.appPaddingR20;

  static void getDeviceInfo(BuildContext context) {
    final sizeMediaQuery = MediaQuery.sizeOf(context);
    themeData = Theme.of(context);

    deviceIsAndroid = Platform.isAndroid;
    deviceIsIos = Platform.isIOS;

    final double devicePixelRatio = sizeMediaQuery.shortestSide;
    if (devicePixelRatio < 550) {
      deviceIsTablet = false;
    } else {
      deviceIsTablet = true;
    }
  }
  //
  static Future<String> getMobileID() async {
    if (deviceIsAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      return androidInfo.id;
    }
    else {
      final keyExit = await getIt<FlutterSecureStorage>()
          .containsKey(key: AppKeys.iosDeviceID);
      if (keyExit) {
        final iosDeviceId =
        await getIt<FlutterSecureStorage>().read(key: AppKeys.iosDeviceID);
        return iosDeviceId!;
      } else {
        final iosDeviceId = Uuid().v4();
        await getIt<FlutterSecureStorage>().write(
          key: AppKeys.iosDeviceID,
          value: iosDeviceId,
          iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock,
          ),
        );
        return iosDeviceId;
      }
    }
  }

  static Future<bool> isHuaweiDevice() async {
    if (AppReference.deviceIsAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      if (androidInfo.manufacturer.toLowerCase().contains('huawei')) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

}
