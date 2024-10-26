import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crafty_bay/controller_blinding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/ui/screens/splash_screen.dart';
import '../presentation/ui/utility/app_colors.dart';

class CraftyBay extends StatefulWidget {
  static final GlobalKey<NavigatorState> globalKey =
      GlobalKey<NavigatorState>();
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  late final StreamSubscription<List<ConnectivityResult>>
      _connectivityResultSubscription;

  @override
  void initState() {
    super.initState();
    checkInternetConnectivity();
    checkInternetConnectivityStatus();
  }

  @override
  void dispose() {
    _connectivityResultSubscription.cancel();
    super.dispose();
  }

  Future<void> checkInternetConnectivity() async {
    final List<ConnectivityResult> connectivityResults =
        await Connectivity().checkConnectivity();
    handleConnectivityStates(connectivityResults);
  }

  void checkInternetConnectivityStatus() {
    _connectivityResultSubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> connectionResults) {
      handleConnectivityStates(connectionResults);
    });
  }

  void handleConnectivityStates(List<ConnectivityResult> connectionResults) {
    if (!connectionResults.contains(ConnectivityResult.mobile) &&
        !connectionResults.contains(ConnectivityResult.wifi)) {
      if (!Get.isSnackbarOpen) {
        Get.showSnackbar(const GetSnackBar(
          title: 'No internet!',
          message: 'Check your internet connectivity.',
          isDismissible: false,
          duration: Duration(seconds: 3),
        ));
      }
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
      }
      Get.snackbar(
        'Connected to internet!',
        'You are online.',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.globalKey,
      initialBinding: ControllerBindings(),
      title: 'CraftyBay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(
          AppColor.primaryColor.value,
          AppColor().color,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            minimumSize: const Size.fromHeight(40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
          AppColor.primaryColor.value,
          AppColor().color,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            minimumSize: const Size.fromHeight(40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      themeMode: ThemeMode.system, // Use system-wide theme preference
      home: const SplashScreen(),
    );
  }
}
