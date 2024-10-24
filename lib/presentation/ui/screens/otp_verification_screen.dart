import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});
  final String email;
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpTEController = TextEditingController();
  final _otpVerificationController = Get.find<OtpVerificationController>();

  @override
  void initState() {
    _otpVerificationController.startCountDown();
    super.initState();
  }

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
              'Enter OTP Code',
              style: context.textStyles.headlineLarge,
            ),
            8.sizeBoxFromHeight,
            Text(
              'A 4 digit OTP has sent to your email',
              style:
                  context.textStyles.bodyLarge.copyWith(color: Colors.black54),
            ),
            16.sizeBoxFromHeight,
            PinCodeTextField(
              appContext: context,
              length: 6,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: Colors.green,
                selectedColor: Colors.lightGreen,
                inactiveFillColor: Colors.white,
                inactiveColor: AppColors.themeColor,
              ),
              animationDuration: const Duration(milliseconds: 300),
              controller: _otpTEController,
            ),
            16.sizeBoxFromHeight,
            GetBuilder<OtpVerificationController>(
                builder: (otpVerificationController) {
              return ElevatedButton(
                  onPressed: () async {
                    _otpVerificationController.timer!.cancel();
                    bool isSuccess = await otpVerificationController.verifyOtp(
                        widget.email, _otpTEController.text);
                    if (isSuccess) {
                      Get.offAll(CompleteProfileScreen());
                    }
                  },
                  child: const Text(
                    'Next',
                  ));
            }),
            16.sizeBoxFromHeight,
            GetBuilder<OtpVerificationController>(
                builder: (otpVerificationController) {
              int count = otpVerificationController.count;
              return count == 0
                  ? Text(
                      'Code is expired',
                      style: context.textStyles.bodyLarge
                          .copyWith(color: Colors.red),
                    )
                  : RichText(
                      text: TextSpan(
                          style: context.textStyles.bodyLarge,
                          text: 'This code will expire in ',
                          children: [
                          TextSpan(
                            style: context.textStyles.bodyLarge.copyWith(
                                color: count <= 15
                                    ? Colors.red
                                    : AppColors.themeColor),
                            text: '${count}s',
                          )
                        ]));
            }),
            GetBuilder<OtpVerificationController>(
                builder: (otpVerificationController) {
              if (otpVerificationController.count == 0) {
                return TextButton(
                    onPressed: () {}, child: const Text('Resend Code'));
              } else {
                return Container();
              }
            })
          ],
        ),
      ),
    );
  }
}
