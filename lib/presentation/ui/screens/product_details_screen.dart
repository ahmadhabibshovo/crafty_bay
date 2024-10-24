import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:crafty_bay/presentation/ui/widgets/color_picker.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../widgets/product_counter.dart';
import '../widgets/size_picker.dart';
import 'review_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductImageSlider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.title,
                          style: context.textStyles.titleMedium),
                      ProductCounter(),
                    ],
                  ),
                  buildReviewSection(),
                  ColorPicker(
                    colors: const [
                      Colors.cyan,
                      Colors.red,
                      Colors.black,
                      Colors.yellow,
                      Colors.grey
                    ],
                    onColorSelected: (color) {
                      print(color);
                    },
                  ),
                  SizePicker(
                    sizes: const [
                      'S',
                      'M',
                      'L',
                      'XL',
                      'XXL',
                    ],
                    onSizeSelected: (size) {
                      print(size);
                    },
                  ),
                  buildProductDetailsSection(context)
                ].separatedBy(16.sizeBoxFromHeight),
              ),
            ),
            _buildAddToCart(context)
          ],
        ),
      ),
    );
  }

  Widget _buildAddToCart(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('Price'),
            Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 20, color: AppColors.themeColor),
            )
          ],
        ),
        SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Add To Cart',
                style: context.textStyles.titleMedium
                    .copyWith(color: Colors.white),
              ),
            ))
      ],
    );
  }

  Widget buildProductDetailsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: context.textStyles.titleMedium),
        Text(
          product.shortDes,
          style: TextStyle(color: Colors.black54),
        )
      ],
    );
  }

  Widget buildReviewSection() {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              8.sizeBoxFromWidth,
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 16,
              ),
              Text(product.star.toString()),
            ].separatedBy(8.sizeBoxFromWidth),
          ),
          TextButton(
              onPressed: () {
                Get.to(ReviewScreen());
              },
              child: const Text(
                'Reviews',
                style: TextStyle(color: AppColors.themeColor),
              )),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: AppColors.themeColor,
            child: Padding(
              padding: 4.paddingAll(),
              child: const Icon(
                Icons.favorite_outline_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          )
        ].separatedBy(4.sizeBoxFromWidth),
      ),
    );
  }
}
