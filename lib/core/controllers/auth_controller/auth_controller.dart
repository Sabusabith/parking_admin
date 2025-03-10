import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:parking_app_admin/core/api_provider/api_provider.dart';
import 'package:parking_app_admin/core/apiconfigs/apiconfigs.dart';
import 'package:parking_app_admin/core/models/auth/generate_otp_model.dart';
import 'package:parking_app_admin/views/auth/otp/otp.dart';
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

      if (response.statusCode == 200) {
        model = GenerateOtpModel.fromJson(response.data);
        var finaldata = model?.data.otp;
        print("Otp :  ${finaldata}");
        Get.to(OTPScreen(otp: finaldata,));
      } else {
       print(model?.message.toString());
      }
    } on DioException catch (error) {
      print(error.response?.data["message"]);

      throw ApiProvider().handleError(error);
    }
  }
}
