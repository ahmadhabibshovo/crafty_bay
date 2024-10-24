import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalCategoryListView extends StatefulWidget {
  const HorizontalCategoryListView({
    super.key,
  });

  @override
  State<HorizontalCategoryListView> createState() =>
      _HorizontalCategoryListViewState();
}

class _HorizontalCategoryListViewState
    extends State<HorizontalCategoryListView> {
  @override
  void initState() {
    Get.find<CategoryListController>().getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryListController>(
        builder: (categoryListController) {
      return Visibility(
        visible: !categoryListController.inProgress,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categoryListController.categoryList.length,
            itemBuilder: (_, index) {
              categoryListController.categoryList.length;
              return CategoryCard(
                category: categoryListController.categoryList[index],
              );
            },
            separatorBuilder: (_, __) => 8.sizeBoxFromWidth),
      );
    });
  }
}
