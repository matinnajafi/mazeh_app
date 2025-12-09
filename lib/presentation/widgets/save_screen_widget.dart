import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mazeh_app/presentation/widgets/recipe_card_widget.dart';

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

class FilterChipsList extends StatelessWidget {
  const FilterChipsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 64,
        child: ListView.builder(
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return PopupMenuButton<int>(
              position: PopupMenuPosition.under,
              icon: Container(
                width: 82,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 209, 203, 203),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'زمان',
                        style: TextStyle(fontFamily: 'CM', fontSize: 12),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(Icons.arrow_drop_down_rounded, size: 24),
                      ),
                    ],
                  ),
                ),
              ),
              color: Colors.grey[200], // background of popup
              onSelected: (value) {
                print("Selected item $value");
              },
              itemBuilder:
                  (context) => const [
                    PopupMenuItem(
                      value: 1,
                      child: Text(
                        'کمتر از 30 دقیقه',
                        style: TextStyle(fontFamily: 'CM'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(
                        'بین 30 تا 60 دقیقه',
                        style: TextStyle(fontFamily: 'CM'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text(
                        'بین 60 تا 120 دقیقه',
                        style: TextStyle(fontFamily: 'CM'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 4,
                      child: Text(
                        'بیشتر از 120 دقیقه',
                        style: TextStyle(fontFamily: 'CM'),
                      ),
                    ),
                  ],
            );
          },
        ),
      ),
    );
  }
}
