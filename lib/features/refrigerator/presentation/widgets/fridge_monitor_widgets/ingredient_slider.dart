import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/refrigerator_widgets/ingredient_card.dart';

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
        itemBuilder: (context, index, pageViewIndex) => IngredientItem(),
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
