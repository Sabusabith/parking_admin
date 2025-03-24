import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:parking_app_admin/core/api_provider/api_provider.dart';
import 'package:parking_app_admin/core/apiconfigs/apiconfigs.dart';
import 'package:parking_app_admin/core/models/auth/refresh_token_model.dart';

class RefreshTokenController extends GetxController {

  var url =  AppUrls.REFRESH_Token;
  RefreshTokebnModel? model;
  refreshToken() async {
    try{
  Response response = await ApiProvider().post(url.toString(), {});
      List<String>? cookies = response.headers['Set-Cookie'];
 for (String cookie in cookies!) {
        print(cookie);
      }
      print("refreshToken response : ${cookies}");

    if (response.statusCode == 200) {
      model = RefreshTokebnModel.fromJson(response.data);
      print("refreshToken response : ${response.statusCode}");
    } else {
      print("error");
    }
  }catch (e){
Exception(e);
  }
}
}