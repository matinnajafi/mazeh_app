import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class IngredientSlider extends StatefulWidget {
  const IngredientSlider({super.key});

  @override
  State<IngredientSlider> createState() => _IngredientSliderState();
}

class _IngredientSliderState extends State<IngredientSlider> {
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
        itemBuilder: (context, index, pageViewIndex) {
          return SizedBox(
            height: 110,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 2,
                right: 2,
                left: 2,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade200.withOpacity(0.8),
                      Colors.blue.shade200.withOpacity(0.3),
                    ],
                    stops: const [0.0, 1.0],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 44,
                      width: 44,
                      child: Image.asset('images/shrimp.png'),
                    ),
                    const Text(
                      'میگو',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'CM',
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      '۵۰۰ گرم',
                      style: TextStyle(
                        color: Color.fromARGB(255, 208, 208, 208),
                        fontFamily: 'CM',
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 110,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
          autoPlayCurve: Curves.easeInOut,
          autoPlayAnimationDuration: const Duration(milliseconds: 3200),
          onPageChanged: (index, reason) {
            setState(() => currentIndex = index);
          },
        ),
      ),
    );
  }
}
