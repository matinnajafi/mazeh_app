import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class RecipeNutritionInfo extends StatelessWidget {
  const RecipeNutritionInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          textAlign: TextAlign.right,
          '20 گرم چربی',
          style: TextStyle(fontFamily: 'CM'),
        ),
        Text(
          textAlign: TextAlign.right,
          '250 کالری انرژی',
          style: TextStyle(fontFamily: 'CM'),
        ),
        Text(
          textAlign: TextAlign.right,
          '15 گرم پروتئین',
          style: TextStyle(fontFamily: 'CM'),
        ),
        Text(
          textAlign: TextAlign.right,
          '30 گرم کربوهیدرات',
          style: TextStyle(fontFamily: 'CM'),
        ),
      ],
    );
  }
}

class RecipeNutritionTitle extends StatelessWidget {
  const RecipeNutritionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.end,
      ': اطلاعات تغذیه‌ای',
      style: TextStyle(
        color: AppColor.greytextColor,
        fontFamily: 'CSB',
        fontSize: 13,
      ),
    );
  }
}
