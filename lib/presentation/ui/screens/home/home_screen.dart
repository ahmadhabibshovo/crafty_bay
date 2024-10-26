import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../state_holders/auth_controller.dart';
import '../../../state_holders/category_controller.dart';
import '../../../state_holders/main_bottom_nav_controller.dart';
import '../../../state_holders/new_product_controller.dart';
import '../../../state_holders/popular_product_controller.dart';
import '../../../state_holders/product_slider_controller.dart';
import '../../../state_holders/special_product_controller.dart';
import '../../utility/image_assets.dart';
import '../../widgets/home/categories.dart';
import '../../widgets/home/circular_icon_button.dart';
import '../../widgets/home/home_slider.dart';
import '../../widgets/product.dart';
import '../../widgets/section_header.dart';
import '../product_list_screen.dart';
import '../auth/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(
          ImageAssets.craftBayNavSVG,
          width: 120,
        ),
        actions: <Widget>[
          CircularIconButton(
            onTap: () {
              Get.to(() => const ProfileScreen());
            },
            icon: Icons.person_2_outlined,
          ),
          const SizedBox(width: 5),
          CircularIconButton(
            onTap: () {
              Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            },
            icon: Icons.wb_sunny_outlined,
          ),
          const SizedBox(width: 5),
          CircularIconButton(
            onTap: () {
              Get.bottomSheet<bool>(
                isDismissible: false,
                AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Are you want to Logout?'),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        Get.back(result: false);
                      },
                      child: const Text('NO'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Get.back(result: true);
                      },
                      child: const Text('YES'),
                    ),
                  ],
                ),
              ).then((value) async {
                if (value == true) {
                  await AuthController.clearUserInfo();
                  Get.snackbar(
                    'Success!',
                    'Logout successful.',
                    backgroundColor: Colors.green,
                  );
                }
              });
            },
            icon: Icons.logout_outlined,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GetBuilder<ProductSliderController>(
                builder: (productSliderController) {
                  if (productSliderController.getHomeSlidersInProgress ==
                      true) {
                    return Shimmer.fromColors(
                      baseColor: Colors.black,
                      highlightColor: Colors.grey,
                      child: Container(
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  }
                  return HomeSlider(
                    productSliderModel: productSliderController
                            .productSliderData.productSliderModel ??
                        [],
                  );
                },
              ),
              const SizedBox(height: 10),
              SectionHeader(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
                theme: theme,
              ),
              const SizedBox(height: 10),
              GetBuilder<CategoryController>(
                builder: (categoryController) {
                  if (categoryController.getCategoryIsInProgress == true) {
                    return SizedBox(
                      height: 112,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            categoryController.categoryModel.data?.length ?? 0,
                        itemBuilder: (context, index) => Shimmer.fromColors(
                          baseColor: Colors.black,
                          highlightColor: Colors.grey,
                          child: Container(
                            height: 110,
                            width: 110,
                            color: theme.primaryColor.withOpacity(0.1),
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                      ),
                    );
                  }
                  return Categories(
                    categories: categoryController.categoryModel.data ?? [],
                    theme: theme,
                  );
                },
              ),
              const SizedBox(height: 10),
              ...getPopularProduct(theme),
              const SizedBox(height: 10),
              ...getNewProduct(theme),
              const SizedBox(height: 10),
              ...getSpecialProduct(theme),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getPopularProduct(ThemeData theme) {
    return <Widget>[
      SectionHeader(
        title: 'Popular',
        onTap: () {
          Get.to(
            () => ProductListScreen(
              categoryTitle: 'Popular Products',
              productModel: Get.find<PopularProductController>().productModel,
            ),
          );
        },
        theme: theme,
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 177,
        child: GetBuilder<PopularProductController>(
          builder: (popularProductController) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  popularProductController.productModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Product(
                  product: popularProductController.productModel.data![index],
                  theme: theme,
                );
              },
            );
          },
        ),
      )
    ];
  }

  List<Widget> getNewProduct(ThemeData theme) {
    return <Widget>[
      SectionHeader(
        title: 'New',
        onTap: () {
          Get.to(
            () => ProductListScreen(
              categoryTitle: 'New Products',
              productModel: Get.find<NewProductController>().newProductModel,
            ),
          );
        },
        theme: theme,
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 177,
        child: GetBuilder<NewProductController>(
          builder: (newProductController) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newProductController.newProductModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Product(
                  product: newProductController.newProductModel.data![index],
                  theme: theme,
                );
              },
            );
          },
        ),
      )
    ];
  }

  List<Widget> getSpecialProduct(ThemeData theme) {
    return <Widget>[
      SectionHeader(
        title: 'Special',
        onTap: () {
          Get.to(
            () => ProductListScreen(
              categoryTitle: 'Special Products',
              productModel:
                  Get.find<SpecialProductController>().specialProductModel,
            ),
          );
        },
        theme: theme,
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 177,
        child: GetBuilder<SpecialProductController>(
          builder: (specialProductController) => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                specialProductController.specialProductModel.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Product(
                product:
                    specialProductController.specialProductModel.data![index],
                theme: theme,
              );
            },
          ),
        ),
      )
    ];
  }
}
