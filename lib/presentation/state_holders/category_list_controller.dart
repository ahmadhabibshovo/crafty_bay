import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/services/network_response.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  List<CategoryModel> categoryList = [];
  bool inProgress = false;
  String errorMessage = '';
  Future getCategoryList() async {
    if (categoryList.isNotEmpty) {
      return;
    }
    inProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getInstance().getRequest(url: Urls.categoryList);
    inProgress = false;
    if (response.isSuccess) {
      (response.responseData['data'] as List).map((e) {
        categoryList.add(CategoryModel.fromJson(e));
      }).toList();
    } else {
      errorMessage = response.errorMessage;
    }

    update();
  }
}
