import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageGalleryIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const ImageGalleryIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    // if there is one or no image, there is no need to display the indicator
    if (itemCount <= 1) return const SizedBox.shrink();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 26,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.15),
              shape: StadiumBorder(),
            ),
            // Use IntrinsicWidth to size the indicator based on the number of dots
            child: IntrinsicWidth(
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: itemCount,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                    spacing: 4.0,
                    radius: 4.0,
                    dotWidth: 6.0,
                    dotHeight: 6.0,
                    expansionFactor: 3.0,
                    paintStyle: PaintingStyle.fill,
                    dotColor: Colors.white54,
                    activeDotColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
