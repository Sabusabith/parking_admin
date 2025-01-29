import 'package:flutter/material.dart';
import 'package:parking_app_admin/utils/common/appcolors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return Scaffold(backgroundColor: kgreencolor,
    body: SizedBox(width: size.width,height: size.height,
    child: Column(
      children: [

      ],
    ),),);
  }
}