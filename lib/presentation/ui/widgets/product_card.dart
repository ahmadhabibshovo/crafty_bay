import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(
              product: product,
            ));
      },
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(.1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(product.image),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w500),
                    maxLines: 1,
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: TextStyle(color: AppColors.themeColor),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            Text(product.star.toString()),
                          ],
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          color: AppColors.themeColor,
                          child: Padding(
                            padding: 4.paddingAll(),
                            child: Icon(
                              Icons.favorite_outline_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        )
                      ].separatedBy(4.sizeBoxFromWidth),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
