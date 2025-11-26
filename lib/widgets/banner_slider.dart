import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CarouselSlider.builder(
        carouselController: _carouselController,
        itemCount: 8,
        itemBuilder:
            (context, index, realIndex) => SizedBox(
              height: 177,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('images/banner$index.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        options: CarouselOptions(
          height: 177,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.easeInOut,
          autoPlayAnimationDuration: const Duration(milliseconds: 2400),
          onPageChanged: (index, reason) {
            setState(() => currentIndex = index);
          },
        ),
      ),
    );
  }
}
