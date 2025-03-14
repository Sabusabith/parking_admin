import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app_admin/core/api_provider/api_provider.dart';
import 'package:parking_app_admin/core/apiconfigs/apiconfigs.dart';
import 'package:parking_app_admin/core/models/auth/generate_otp_model.dart';
import 'package:parking_app_admin/views/auth/otp/otp.dart';
import '../../../utils/common/appcolors.dart';
import '../../../views/home/home.dart';
import 'package:dio/dio.dart';


class AuthController extends GetxController {
  var isTyping = false.obs;
  var verificationId = ''.obs;

  var url = AppUrls.BASE_URL + AppUrls.Generate_OTP;
  GenerateOtpModel? model;
  loginFn(Map data) async {
    try {
      Response response = await ApiProvider().post(url, data);
      var mobilnum = data["mobileNumber"];
      print("mobile number: $mobilnum");

      if (response.statusCode == 200) {
        model = GenerateOtpModel.fromJson(response.data);
        var finaldata = model?.data.otp;
        print("Otp :  ${finaldata}");
        Get.to(()=>OTPScreen(mobilenum: mobilnum.toString(),otp: finaldata.toString(),));
      } else {
       print(model?.message.toString());
      }
    } on DioException catch (error) {
      print(error.response?.data["message"]);
      //  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      //                     backgroundColor: ksecndrycolor,
      //                     content: Text(
      //                      error.response?.data["message"],
      //                       style: GoogleFonts.publicSans(
      //                           color: Colors.white, fontSize: 15),
      //                     )));

      throw ApiProvider().handleError(error);
    }
  }
}
