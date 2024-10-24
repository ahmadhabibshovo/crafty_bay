import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductListScreen(
          categoryName: category.categoryName,
          id: 1,
        ));
      },
      child: Column(
        children: [
          Container(
            padding: 8.paddingAll(),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Image.network(category.categoryImg),
              ],
            ),
          ),
          4.sizeBoxFromHeight,
          Text(
            category.categoryName,
            style: context.textStyles.titleMedium
                .copyWith(fontSize: 18)
                .copyWith(color: AppColors.themeColor),
          )
        ],
      ),
    );
  }
}
