import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/glass_action_button.dart';
import 'package:mazeh_app/features/recipe/presentation/widgets/image_banner_indicator.dart';
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
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(10),
                  child: Column(
                    children: [
                      ImageBannersIndicator(),
                      SizedBox(height: 8.0),
                      BottomSheetHeader(showRightRadius: false),
                    ],
                  ),
                ),
                backgroundColor: AppColor.red,
                expandedHeight: 220,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.none,
                  background: Image.asset(
                    'images/banner2.png',
                    fit: BoxFit.cover,
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
          body: const CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 24, left: 12, bottom: 8),
                  child: RecipeDescription(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 24, top: 8, bottom: 2),
                  child: RecipeNutritionTitle(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 24, left: 12, bottom: 8),
                  child: RecipeNutritionInfo(),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(right: 24, top: 8, bottom: 6),
                  child: RecipeIngredientsTitle(),
                ),
              ),
              SliverToBoxAdapter(child: RecipeIngredientsList()),
              SliverToBoxAdapter(child: InteractiveTimeline()),
              SliverToBoxAdapter(
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
