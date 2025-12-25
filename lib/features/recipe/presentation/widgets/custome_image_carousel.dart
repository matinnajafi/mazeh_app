import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/image_gallery_indicator.dart';

class CustomImageCarousel extends StatefulWidget {
  final List<String> images; // Image paths

  const CustomImageCarousel({super.key, required this.images});

  @override
  State<CustomImageCarousel> createState() => _CustomImageCarouselState();
}

class _CustomImageCarouselState extends State<CustomImageCarousel> {
  int _currentActiveIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    // if there are no images, show placeholder
    if (widget.images.isEmpty) {
      return ImagePlaceHolder();
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Slider
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 400,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            reverse: true, // to match RTL direction
            onPageChanged: (index, reason) {
              setState(() {
                _currentActiveIndex = index;
              });
            },
          ),
          items:
              widget.images.map((path) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Image.asset(path, fit: BoxFit.cover),
                );
              }).toList(),
        ),

        // Indicator
        Positioned(
          bottom: 24,
          child: ImageGalleryIndicator(
            currentIndex: _currentActiveIndex,
            itemCount: widget.images.length,
          ),
        ),
      ],
    );
  }
}

// Placeholder widget for when there are no images
class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300]),
      width: double.infinity,
      height: 400,
      child: Icon(Icons.image_not_supported, color: Colors.grey[600], size: 44),
    );
  }
}
