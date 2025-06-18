
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'config/bloc/bloc_observer.dart';
import 'core/services/services_locator.dart';
import 'core/utils/exports.dart';
import 'my_app/app_requirement_setup.dart';
import 'my_app/my_app.dart';





Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  AppRequirementSetup.registerHiveAdapter();
  configureDependencies();
  /*

   final dir = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = dir.path;
   */
  runApp(  MyApp());
  Bloc.observer = MyBlocObserver();

}


// line for generatingي
// dart run build_runner watch --delete-conflicting-outputs

// flutter pub run build_runner watch --delete-conflicting-outputs