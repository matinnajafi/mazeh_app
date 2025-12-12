import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mazeh_app/features/home/presentation/widgets/recipe_card_widget.dart';

class UserSavedRecipes extends StatelessWidget {
  const UserSavedRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 300),
              child: SlideAnimation(
                curve: Curves.ease,
                verticalOffset: 10.0,
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  curve: Curves.easeIn,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: const SizedBox(
                      height: 160,
                      child: RecipeCardWidget(),
                    ),
                  ),
                ),
              ),
            ),
          );
        }, childCount: 12),
      ),
    );
  }
}
