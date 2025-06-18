import 'package:flutter/material.dart';
import '../config/resources/theme/light_theme.dart';
import '../config/responsive/responsive.dart';
import '../config/routes/routes_generator.dart';
import '../config/routes/routes_names.dart';
import 'app_reference.dart';


class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void didChangeDependencies() async {
    AppReference.getDeviceInfo(context);

    ResponsiveManager.init(context);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarIconBrightness: Brightness.dark, // For dark icons
    //   statusBarColor: Colors.transparent, // Optional: Set the status bar color
    // ));
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // localizationsDelegates: const [
      // // GlobalMaterialLocalizations.delegate,
      // // GlobalCupertinoLocalizations.delegate,
      // // GlobalWidgetsLocalizations.delegate,
      // ],
      //   supportedLocales: const [
      //   Locale('ar', 'SA'),
      //   ],
       // locale: state?.selectedLanguage.value,
       //  navigatorObservers: [routeObserver],
        debugShowCheckedModeBanner: false,
        // title: AppStrings.appNameArabic,
        themeMode: ThemeMode.light,
        //ToDo: where is fix update theme?
        theme: appLightTheme(),
        onGenerateRoute: AppRouteGenerator.onGenerateRoute,
        initialRoute: AppRoutesNames.rUsersListScreen,
        // navigatorKey: navigatorKey,
        );

  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();



