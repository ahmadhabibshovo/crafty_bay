import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/state_holders/slider_list_controller.dart';
import 'package:crafty_bay/presentation/ui/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({super.key});

  @override
  _HomeBannerSliderState createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  final sliderListController = Get.find<SliderListController>();
  @override
  void initState() {
    sliderListController.getSliderList();
    super.initState();
  }

  int _currentIndex = Get.find<SliderListController>().sliderList.length;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderListController>(builder: (sliderListController) {
      return Visibility(
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        visible: !sliderListController.inProgress,
        child: Column(
          children: [
            CarouselSlider(
              items: sliderListController.sliderList
                  .map((item) => Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(
                                  item.image,
                                ))),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.price,
                                        style: context.textStyles.titleLarge
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    16.sizeBoxFromHeight,
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Buy Now'))
                                  ],
                                ),
                              ),
                              Expanded(child: Container())
                            ],
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  Get.find<SliderListController>().sliderList.length, (i) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == i ? Colors.blueAccent : Colors.grey,
                  ),
                );
              }),
            )
          ],
        ),
      );
    });
  }
}
