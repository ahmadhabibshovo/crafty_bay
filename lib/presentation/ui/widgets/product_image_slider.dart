import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key});

  @override
  _ProductImageSliderState createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  int _currentIndex = 0;
  final List<String> imgList = [
    "https://ecommerce-api.codesilicon.com/images/product1.jpeg",
    "https://ecommerce-api.codesilicon.com/images/product1.jpeg",
    "https://ecommerce-api.codesilicon.com/images/product1.jpeg",
    "https://ecommerce-api.codesilicon.com/images/product1.jpeg",
    "https://ecommerce-api.codesilicon.com/images/product1.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: imgList
              .map((item) => Image.network(item,
                  fit: BoxFit.cover, width: double.infinity))
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                print(index);
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imgList.length, (i) {
              return Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == i ? Colors.blueAccent : Colors.white,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
