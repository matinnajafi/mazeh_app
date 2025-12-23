import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/refrigerator_widgets/ingredient_card.dart';

class RecipeIngredientsList extends StatelessWidget {
  const RecipeIngredientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: IngredientItem(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class RecipeIngredientsTitle extends StatelessWidget {
  const RecipeIngredientsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.end,
      ': مواد لازم',
      style: TextStyle(
        color: AppColor.greytextColor,
        fontFamily: 'CSB',
        fontSize: 13,
      ),
    );
  }
}
