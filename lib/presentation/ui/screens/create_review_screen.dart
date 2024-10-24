import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_bar_controller.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: Get.find<BottomNavBarController>().backToHome,
        ),
        title: const Text('Create Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'First Name'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Last Name'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Write Review'),
              maxLines: 8,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Submit'))
          ].separatedBy(26.sizeBoxFromHeight),
        ),
      ),
    );
  }
}
