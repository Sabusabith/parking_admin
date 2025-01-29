import 'dart:async';
import 'package:get/get.dart';

class OTPController extends GetxController {
  var countdown = 15.obs; 
  var canResend = false.obs; 
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    canResend.value = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value == 0) {
        canResend.value = true; 
        _timer.cancel();
      } else {
        countdown.value--;
      }
    });
  }

  void restartTimer() {
    countdown.value = 15;
    startTimer(); 
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
