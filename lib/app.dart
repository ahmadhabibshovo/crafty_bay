import 'package:crafty_bay/controller_bindings.dart';
import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 20)),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.themeColor),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: AppColors.themeColor),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: AppColors.themeColor,
                  foregroundColor: Colors.white,
                  fixedSize: const Size.fromWidth(double.maxFinite))),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(color: Colors.black54),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              border: _outlineInputBorder(),
              enabledBorder: _outlineInputBorder(),
              focusedBorder: _outlineInputBorder(),
              errorBorder: _outlineInputBorder(Colors.red)),
          textButtonTheme: TextButtonThemeData(
              style:
                  TextButton.styleFrom(foregroundColor: AppColors.themeColor))),
      home: const SplashScreen(),
    );
  }

  OutlineInputBorder _outlineInputBorder([Color? color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.themeColor),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
