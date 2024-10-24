import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCounter extends StatelessWidget {
  ProductCounter({
    super.key,
  });
  RxInt count = 1.obs;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            if (count > 0) {
              count--;
            }
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(color: AppColors.themeColor),
            child: Center(
                child: Icon(
              Icons.remove,
            )),
          ),
        ),
        Obx(
          () => Padding(
            padding: 8.paddingHorizontal(),
            child: Text(count.toString()),
          ),
        ),
        InkWell(
          onTap: () {
            count++;
          },
          child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(color: AppColors.themeColor),
              child: Icon(Icons.add)),
        )
      ],
    );
  }
}
