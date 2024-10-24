import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:get/get.dart';

import 'presentation/state_holders/category_list_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpVerificationController(), fenix: true);
    Get.lazyPut(() => BottomNavBarController(), fenix: true);
    Get.lazyPut(() => SliderListController(), fenix: true);
    Get.lazyPut(() => CategoryListController(), fenix: true);
    Get.lazyPut(() => EmailVerificationController(), fenix: true);
    Get.lazyPut(() => ProductListByCategoryController(), fenix: true);
    Get.create<ProductListController>(() => ProductListController());
  }
}
