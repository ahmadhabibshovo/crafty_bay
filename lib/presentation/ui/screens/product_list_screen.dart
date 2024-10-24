import 'package:crafty_bay/presentation/state_holders/product_list_by_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen(
      {super.key, required this.categoryName, required this.id});
  final String categoryName;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductListByCategoryController>(
            builder: (productListByCategoryController) {
          productListByCategoryController.getProductListByCategory(id);
          return Visibility(
            visible: !productListByCategoryController.inProgress,
            replacement: Center(
              child: CircularProgressIndicator(),
            ),
            child: GridView.builder(
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: .68,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: productListByCategoryController.productList[index],
                  );
                }),
          );
        }),
      ),
    );
  }
}
