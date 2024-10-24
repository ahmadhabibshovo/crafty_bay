import 'dart:async';

import 'package:get/get.dart';

import '../../data/services/network_caller.dart';
import '../../data/services/network_response.dart';
import '../../data/utils/urls.dart';

class OtpVerificationController extends GetxController {
  int count = 120;
  Timer? timer;
  startCountDown() async {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      print(count);
      count--;
      update();
      if (count == 0) {
        timer.cancel();
      }
    });
  }

  bool inProgress = false;
  String errorMessage = '';
  Future<bool> verifyOtp(String email, String otp) async {
    inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getInstance()
        .getRequest(url: Urls.verifyLogin(email, otp));
    inProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      errorMessage = response.errorMessage;
      return false;
    }
  }
}
