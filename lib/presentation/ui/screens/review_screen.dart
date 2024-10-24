import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/presentation/ui/screens/create_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_bar_controller.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: Get.find<BottomNavBarController>().backToHome,
        ),
        title: Text('Review'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Padding(
              padding: 8.paddingHorizontal(),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.black12,
                                  child: Icon(Icons.person_2_outlined)),
                              7.sizeBoxFromWidth,
                              Text(
                                'Rabbil Hasan',
                                style: context.textStyles.titleMedium,
                              )
                            ],
                          ),
                          8.sizeBoxFromHeight,
                          Text(
                              'dadssgsafsdjafhsda hfgha sfhasdg fjhadg hsdgf hagf hgdshfghsdgfhsdagghghgf jhafhagshasgdf hashfashd fagdjhasgdhsadgashgasjd,sdasgdhasgdhgashdags jh adhg ')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          })),
          Container(
            decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(.2),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            height: 80,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Reviews (1000)',
                style: context.textStyles.titleMedium,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.themeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: () {
          Get.to(CreateReviewScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
