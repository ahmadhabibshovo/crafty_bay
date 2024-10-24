import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/presentation/ui/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_bar_controller.dart';
import '../utils/app_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: Get.find<BottomNavBarController>().backToHome,
        ),
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CartItemCard();
                }),
          ),
          _buildAddToCart(context)
        ],
      ),
    );
  }

  Widget _buildAddToCart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              Text('Total Price'),
              Text(
                r'$100',
                style: TextStyle(fontSize: 20, color: AppColors.themeColor),
              )
            ],
          ),
          SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Checkout',
                  style: context.textStyles.titleMedium
                      .copyWith(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
