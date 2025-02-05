import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_app_admin/views/home/home.dart';
import 'package:parking_app_admin/views/splash/splash.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
     home: Splash());
     
  }
}
