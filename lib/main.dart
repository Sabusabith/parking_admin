import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_app_admin/views/splash/splash.dart';

import 'core/data/firebase/firebase_options.dart';

void main(List<String> args)async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
  );
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
