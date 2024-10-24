import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/services/network_response.dart';
import 'package:get/get.dart';

import '../../data/utils/urls.dart';

class EmailVerificationController extends GetxController {
  bool inProgress = false;
  String errorMessage = '';
  Future<bool> verifyEmail(String email) async {
    inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getInstance()
        .getRequest(url: Urls.userLogin(email));
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
