import 'package:crafty_bay/data/models/slider_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/services/network_response.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

import '../../data/models/slider_model.dart';

class SliderListController extends GetxController {
  List<SliderModel> sliderList = [];
  bool inProgress = false;
  String errorMessage = '';
  Future getSliderList() async {
    if (sliderList.isNotEmpty) {
      return;
    }
    inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getInstance()
        .getRequest(url: Urls.listProductSlider);
    inProgress = false;

    if (response.isSuccess) {
      sliderList = SliderListModel.fromJson(response.responseData).data ?? [];
    } else {
      errorMessage = response.errorMessage;
    }

    update();
  }
}
