import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _emailTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            82.sizeBoxFromHeight,
            const AppLogoWidget(),
            24.sizeBoxFromHeight,
            Text(
              'Welcome back',
              style: context.textStyles.headlineLarge,
            ),
            8.sizeBoxFromHeight,
            Text(
              'Please enter your email address',
              style:
                  context.textStyles.bodyLarge.copyWith(color: Colors.black54),
            ),
            16.sizeBoxFromHeight,
            TextFormField(
              controller: _emailTEController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            16.sizeBoxFromHeight,
            GetBuilder<EmailVerificationController>(
                builder: (emailVerificationController) {
              return Visibility(
                replacement: Center(
                  child: CircularProgressIndicator(),
                ),
                visible: !emailVerificationController.inProgress,
                child: ElevatedButton(
                    onPressed: onTapNextButton,
                    child: Text(
                      'Next',
                    )),
              );
            })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }

  void onTapNextButton() async {
    bool isSuccess = await Get.find<EmailVerificationController>()
        .verifyEmail(_emailTEController.text.trim());
    if (isSuccess) {
      Get.to(OtpVerificationScreen(email: _emailTEController.text.trim()));
    }
  }
}
