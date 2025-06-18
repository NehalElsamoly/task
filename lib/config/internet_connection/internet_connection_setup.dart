import 'package:flutter/material.dart';
import 'package:task/core/utils/exports.dart';
import 'dart:ui' as ui;
import '../resources/app_colors.dart';
import '../resources/app_text_style.dart';
import '../resources/app_values.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../routes/route_manager.dart';
import '../routes/routes_names.dart';

//device connection
//  الجها  و فيه متغير هنقول من خلاله للتطبيق هل فيه نت او لاه بيشوف
class ConnectivityController {
  final Connectivity _connectivity = Connectivity();
  ValueNotifier<bool> isConnected = ValueNotifier(false);
  Future<void> init() async {
    List<ConnectivityResult> result =  await _connectivity.checkConnectivity();
    isInternetConnected(result);
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
       isInternetConnected(result);

    });
  }
  bool isInternetConnected(List<ConnectivityResult?> result) {
    if (result.contains(ConnectivityResult.none) ) {
      isConnected.value = false;
      return false;
    } else if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      isConnected.value = true;
      return true;
    }
    return false;
  }
}


//alert under screen
// بنءا ع القيمة من فوق ويينادي ع النيتورك اليرت رض الاليرت الي تحت هيعب
class ConnectionAlert extends StatefulWidget {
  const ConnectionAlert({super.key});
  @override
  State<ConnectionAlert> createState() => _ConnectionAlertState();
}
class _ConnectionAlertState extends State<ConnectionAlert> {
  ConnectivityController connectivityController = ConnectivityController();
  @override
  void initState() {
    connectivityController.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: connectivityController.isConnected,
        builder: (context, value, child) {
          if (value) {
            return const SizedBox.shrink();
          } else {
            return const _NetworkAlertBar();
          }
        });
  }
}

// if you have internet in home after not connection go to splash again
class SplashConnectionAlert extends StatefulWidget {
  const SplashConnectionAlert({super.key});
  @override
  State<SplashConnectionAlert> createState() => _SplashConnectionAlertState();
}
class _SplashConnectionAlertState extends State<SplashConnectionAlert> {
  ConnectivityController
  connectivityController = ConnectivityController();
  @override
  void initState() {
    connectivityController._connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if(result.contains(ConnectivityResult.wifi) || result.contains(ConnectivityResult.mobile)) {
        if(mounted) {


          RouteManager.rPushNamedAndRemoveUntil(context: context, rName: AppRoutesNames.rSplashScreen);
        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  const SizedBox.shrink();
  }
}
//ui when not have internet
class _NetworkAlertBar extends StatelessWidget {
  const _NetworkAlertBar();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: AppColors.failColor,
        height: AppSize.s50.responsiveHeight,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:AppSize.s20.responsiveWidth),
          child: Row(
            textDirection: ui.TextDirection.rtl,
            children:  [
              const Icon(
                Icons.error,
                color: AppColors.white,
                textDirection: ui.TextDirection.rtl,
              ),
              AppSize.s10.sizedBoxWidth,
              Text("لا يوجد اتصال بالانترنت",
                textDirection: ui.TextDirection.rtl,
                style: const AppTextStyle().bodyMedium14.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// remove alert after connect
//ValueListenableBuilder
