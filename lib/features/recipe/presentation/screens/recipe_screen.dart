import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/recipe/presentation/screens/recipe_gallery_screen.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/custome_image_carousel.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/glass_action_button.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/lets_cook_button.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/recipe_info.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/recipe_ingredient.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/recipe_nutrition.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/timeline_widget.dart';
import 'package:mazeh_app/shared/widgets/bottom_sheet_header.dart';
import 'package:mazeh_app/shared/widgets/tile_divider.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 56,
                actionsPadding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  top: 16,
                ),
                actions: const [
                  GlassActionButton(
                    asset: 'images/arrow_back.png',
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 7,
                      top: 6,
                      bottom: 6,
                    ),
                    onTap: null,
                  ),
                  Spacer(),
                  GlassActionButton(
                    asset: 'images/icon_share_white.png',
                    padding: EdgeInsets.all(10),
                    onTap: null,
                  ),
                  SizedBox(width: 10),
                  GlassActionButton(
                    asset: 'images/icon_bookmark_white.png',
                    padding: EdgeInsets.all(8),
                    onTap: null,
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(10),
                  child: const BottomSheetHeader(showRightRadius: false),
                ),
                backgroundColor: AppColor.red,
                expandedHeight: 240,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  background: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 700),
                          pageBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                          ) {
                            return RecipeGalleryScreen();
                          },
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            return SharedAxisTransition(
                              animation: animation.drive(
                                CurveTween(curve: Curves.ease),
                              ),
                              secondaryAnimation: secondaryAnimation,
                              transitionType:
                                  SharedAxisTransitionType
                                      .vertical, // Moves bottom to top
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: CustomImageCarousel(
                      isBannerSlider: true,
                      images: [
                        'images/banner2.png',
                        'images/pasta1.jpg',
                        'images/pasta2.jpg',
                        'images/pasta3.jpg',
                        'images/pasta4.jpg',
                        'images/pasta5.jpg',
                      ],
                    ),
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 12)),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: MealTimeAndDuration(),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 24, left: 20),
                  child: RecipeHeader(),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 24, left: 24, top: 8),
                  child: RecipeTagsBar(),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34, vertical: 6),
                  child: TileDivider(thickness: 1.0),
                ),
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 24, left: 12),
                  child: RecipeDescription(),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 16)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 24, bottom: 4),
                  child: const RecipeNutritionTitle(),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: NutritionExpandableList(),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 16)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 24, bottom: 4),
                  child: const RecipeIngredientsTitle(),
                ),
              ),
              const SliverToBoxAdapter(child: RecipeIngredientsList()),
              const SliverToBoxAdapter(child: InteractiveTimeline()),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 24,
                    left: 24,
                    top: 6,
                    bottom: 32,
                  ),
                  child: LetsCookButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
