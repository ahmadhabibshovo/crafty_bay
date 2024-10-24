import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_counter.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({super.key});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 8.paddingHorizontal(),
      child: Card(
        child: SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  AssetsPath.dummyProductImage,
                  height: 80,
                ),
                8.sizeBoxFromWidth,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('New Year Special Shoe',
                                  style: context.textStyles.titleMedium),
                              InkWell(
                                onTap: () {},
                                child: Icon(Icons.delete),
                              )
                            ],
                          ),
                          Text('Color: Red, Size: X',
                              style: context.textStyles.bodySmall),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$100',
                            style: TextStyle(
                                fontSize: 20, color: AppColors.themeColor),
                          ),
                          ProductCounter()
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
