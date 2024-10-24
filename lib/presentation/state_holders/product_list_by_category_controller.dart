import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/services/network_response.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

import '../../data/models/product_model.dart';

class ProductListByCategoryController extends GetxController {
  List<ProductModel> productList = [];
  bool inProgress = false;
  String errorMessage = '';
  Future getProductListByCategory(int id) async {
    if (productList.isNotEmpty) {
      return;
    }
    inProgress = true;

    update();
    final NetworkResponse response = await NetworkCaller.getInstance()
        .getRequest(url: Urls.listProductByCategory(id));
    inProgress = false;
    update();
    if (response.isSuccess) {
      (response.responseData['data'] as List).map((e) {
        productList.add(ProductModel.fromJson(e));
      }).toList();
    } else {
      errorMessage = response.errorMessage;
    }
    update();
  }
}
