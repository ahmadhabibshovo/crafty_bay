import 'package:crafty_bay/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryListController = Get.find<CategoryListController>();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: Get.find<BottomNavBarController>().backToHome,
        ),
        title: const Text('Categories'),
      ),
      body: GridView.builder(
        itemCount: categoryListController.categoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: .75,
        ),
        itemBuilder: (_, index) {
          return CategoryCard(
              category: categoryListController.categoryList[index]);
        },
      ),
    );
  }
}
