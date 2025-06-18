import 'package:flutter/material.dart';


Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(

      body: const Center(
        child: Text('قم باعادة تشغيل التطبيق'),
      ),
    ),
  );
}
