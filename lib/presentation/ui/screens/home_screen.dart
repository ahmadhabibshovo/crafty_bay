import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:crafty_bay/presentation/ui/screens/email_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:crafty_bay/presentation/ui/widgets/home_banner_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/horizontal_product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../state_holders/bottom_nav_bar_controller.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/horizontal_category_list_view.dart';
import '../widgets/search_text_field.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchTextField(),
              HomeBannerSlider(),
              _buildCategoriesSection(context),
              _buildPopularProductSection(context),
              _buildSpecialProductSection(context),
              _buildNewProductSection(context)
            ].separatedBy(8.sizeBoxFromHeight),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductSection(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'Popular', onTap: () {}),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(
            productRemark: 'Popular',
          ),
        )
      ],
    );
  }

  Widget _buildSpecialProductSection(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'Special', onTap: () {}),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(
            productRemark: 'Special',
          ),
        )
      ],
    );
  }

  Widget _buildNewProductSection(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'New', onTap: () {}),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(
            productRemark: 'New',
          ),
        )
      ],
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          onTap: Get.find<BottomNavBarController>().goToCategory,
          title: 'Categories',
        ),
        SizedBox(height: 200, child: HorizontalCategoryListView()),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
        AppBarIconButton(
          onTap: () {
            Get.to(EmailVerificationScreen());
          },
          iconData: Icons.person,
        ),
        AppBarIconButton(
          onTap: () {
            Get.to(EmailVerificationScreen());
          },
          iconData: Icons.call,
        ),
        AppBarIconButton(
          onTap: () {
            Get.to(EmailVerificationScreen());
          },
          iconData: Icons.notifications_active_outlined,
        )
      ].separatedBy(8.sizeBoxFromWidth),
    );
  }
}
