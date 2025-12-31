import 'package:flutter/material.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/custome_image_carousel.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/glass_action_button.dart';

class RecipeGalleryScreen extends StatelessWidget {
  const RecipeGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GlassActionButton(
                    asset: 'images/arrow_back.png',
                    padding: EdgeInsets.all(8),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            CustomImageCarousel(
              isBannerSlider: false,
              images: [
                'images/banner2.png',
                'images/pasta1.jpg',
                'images/pasta2.jpg',
                'images/pasta3.jpg',
                'images/pasta4.jpg',
                'images/pasta5.jpg',
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Colors.grey.withOpacity(0.2),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                'images/pasta${index + 1}.jpg',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
