import 'package:crafty_bay/presentation/state_holders/product_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_card.dart';

class HorizontalProductListView extends StatefulWidget {
  const HorizontalProductListView({
    super.key,
    required this.productRemark,
  });
  final String productRemark;
  @override
  State<HorizontalProductListView> createState() =>
      _HorizontalProductListViewState();
}

class _HorizontalProductListViewState extends State<HorizontalProductListView> {
  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(builder: (productListController) {
      productListController.getProductList(widget.productRemark);
      return Visibility(
        visible: !productListController.inProgress,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: productListController.productList.length,
            itemBuilder: (_, index) {
              return ProductCard(
                product: productListController.productList[index],
              );
            },
            separatorBuilder: (_, __) => 8.sizeBoxFromWidth),
      );
    });
  }
}
