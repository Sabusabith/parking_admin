import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_app_admin/views/splash/splash.dart';

void main(List<String> args) {
  runApp(MyApp());
  // runApp(DevicePreview(
  //   enabled: true, // Set this to false for production
  //   builder: (context) => MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
    );
  }
}
