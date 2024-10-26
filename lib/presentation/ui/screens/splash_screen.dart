import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../state_holders/auth_controller.dart';
import '../utility/image_assets.dart';
import './auth/email_verification_screen.dart';
import './main_bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Center(
            child: SvgPicture.asset(
              ImageAssets.appLogo,
              width: 100,
            ),
          ),
          const Spacer(),
          const CircularProgressIndicator.adaptive(),
          const SizedBox(height: 10),
          const Text('Version 1.0.0'),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  Future<void> _navigateToNextScreen() async {
    await AuthController.readAccessToken();
    Future.delayed(
      const Duration(seconds: 3),
    ).then((value) {
      Get.offAll(() => const MainBottomNavBarScreen());
      // Get.offAll(
      //   () => AuthController.isLoggedIn
      //       ? const MainButtomNavBarScreen()
      //       : const EmailVerificationScreen(),
      // );
    });
  }
}
