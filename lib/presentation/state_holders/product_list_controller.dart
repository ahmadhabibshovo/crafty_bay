import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/services/network_response.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

import '../../data/models/product_model.dart';

class ProductListController extends GetxController {
  List<ProductModel> productList = [];
  bool inProgress = false;
  String errorMessage = '';
  Future getProductList(String remark) async {
    if (productList.isNotEmpty) {
      return;
    }
    inProgress = true;

    update();
    final NetworkResponse response = await NetworkCaller.getInstance()
        .getRequest(url: Urls.listProductByRemark(remark));
    inProgress = false;
    if (response.isSuccess) {
      (response.responseData['data'] as List).map((item) {
        productList.add(ProductModel.fromJson(item));
      }).toList();
    } else {
      errorMessage = response.errorMessage;
    }
    update();
    print(productList.length);
  }
}
