import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
              children: [
            const AppLogoWidget(),
            Text(
              'Complete Profile',
              style: context.textStyles.headlineLarge,
            ),
            Text(
              'Get started with us with your details',
              style:
                  context.textStyles.bodyLarge.copyWith(color: Colors.black54),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: 'First Name'),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: 'Last Name'),
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(hintText: 'Mobile'),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: 'City'),
            ),
            TextFormField(
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(hintText: 'Shipping Address'),
              maxLines: 3,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(HomeScreen());
                },
                child: Text(
                  'Complete',
                ))
          ].separatedBy(6.sizeBoxFromHeight)),
        ),
      ),
    );
  }
}
