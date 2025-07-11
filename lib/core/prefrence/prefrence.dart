

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';



late SharedPreferences prefs;
late FlutterSecureStorage storage;
class Preferences {
  static final Preferences instance = Preferences._internal();

  Preferences._internal();

  factory Preferences() => instance;
  final FlutterSecureStorage storage = FlutterSecureStorage();


  // Future<void> setFirstInstall() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('onBoarding', 'Done');
  // }

  // Future<String?> getFirstInstall() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? jsonData = prefs.getString('onBoarding');
  //   return jsonData;
  // }

  // Future<void> setUser(LoginModel loginModel) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString(
  //       'user', jsonEncode(LoginModel.fromJson(loginModel.toJson())));
  //   print(await getUserModel());
  // }
  //



  //
  // Future<void> clearUser()async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.remove('user');
  // }
  Future<void> clearUser() async {
    await storage.delete(key: 'user');
  }
  // Future<LoginModel> getUserModel() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String? jsonData = preferences.getString('user');
  //   LoginModel userModel;
  //   if (jsonData != null) {
  //     userModel = LoginModel.fromJson(jsonDecode(jsonData));
  //   } else {
  //     userModel = LoginModel();
  //   }
  //   return userModel;
  // }
  Future<void> clearShared()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  // Future<void> savedLang(String local) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString(AppStrings.locale, local);
  // }

  // Notification token
  String? getNotificationToken() {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    return  prefs.getString('notificationToken');
  }

  Future<dynamic> setNotificationToken({required String value}) {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    return   prefs.setString('notificationToken', value);
  }
}