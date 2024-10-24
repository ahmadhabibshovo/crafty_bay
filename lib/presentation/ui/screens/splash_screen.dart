import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_logo_widget.dart';
import 'main_bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    moveToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            AppLogoWidget(),
            CircularProgressIndicator(),
            Spacer(),
            Text(
              'version 1.0.0',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAll(const MainBottomNavScreen());
  }
}
