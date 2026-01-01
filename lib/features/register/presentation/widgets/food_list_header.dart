import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class FoodListHeader extends StatelessWidget {
  const FoodListHeader({
    super.key,
    required ScrollController controllerRight,
    required ScrollController controllerLeft,
  }) : _controllerRight = controllerRight,
       _controllerLeft = controllerLeft;

  final ScrollController _controllerRight;
  final ScrollController _controllerLeft;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  // top list - move to right
                  Expanded(
                    child: ListView.builder(
                      controller: _controllerRight,
                      scrollDirection: Axis.horizontal,
                      itemCount: 1000,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            bottom: 0,
                            top: 6,
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              image: const DecorationImage(
                                image: AssetImage('images/recipe.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // bottom list - move to left
                  Expanded(
                    child: ListView.builder(
                      controller: _controllerLeft,
                      scrollDirection: Axis.horizontal,
                      itemCount: 1000,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            bottom: 6,
                            top: 2,
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage('images/recipe.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // gradient overlay
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.backgroundColor,
                  AppColor.backgroundColor.withOpacity(0.95),
                  AppColor.backgroundColor.withOpacity(0.25),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.1, 0.4, 0.6],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
