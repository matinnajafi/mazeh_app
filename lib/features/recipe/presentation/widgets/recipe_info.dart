import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class RecipeDescription extends StatelessWidget {
  const RecipeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.right,
      'پاستا یک غذای مربوط به دهه 1960,. هست و از آن زمان عشایر اروپای غربی به پخت این غذا روی اوردند و در حال حاضر یکی از محبوب ترین غداهای شهرغذای مربوط به دهه 1960,. هست و از آن زمان عشایر اروپای غربی به پخت این غذا روی اوردند و در حال حاضر یکی از محبوب ترین غداهای شهر ایتالیاست',
      style: TextStyle(fontFamily: 'CSB'),
    );
  }
}

class RecipeTagsBar extends StatelessWidget {
  const RecipeTagsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '۴ نظر ثبت شده',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Colors.blue,
            fontFamily: 'CM',
            fontSize: 12,
            textBaseline: TextBaseline.ideographic,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.only(
            top: 1,
            bottom: 3,
            left: 12,
            right: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.pinkAccent.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'محبوب',
            style: TextStyle(
              fontFamily: 'CSB',
              color: Colors.pinkAccent,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 4),
        Container(
          padding: const EdgeInsets.only(
            top: 1,
            bottom: 3,
            left: 12,
            right: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'آسان',
            style: TextStyle(
              fontFamily: 'CSB',
              color: Colors.green,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class RecipeHeader extends StatelessWidget {
  const RecipeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: List.generate(
              4,
              (_) => Icon(Icons.star_rate_rounded, color: Colors.amber),
            )..add(Icon(Icons.star_half_rounded, color: Colors.amber)),
          ),
        ),
        Text(
          'پاستا ایتالیایی',
          style: TextStyle(fontFamily: 'CSB', fontSize: 26),
        ),
      ],
    );
  }
}

class MealTimeAndDuration extends StatelessWidget {
  const MealTimeAndDuration({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '۲۵ دقیقه',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: AppColor.greytextColor,
            fontFamily: 'CSB',
            fontSize: 12,
          ),
        ),
        Text(
          'ناهار / شام',
          style: TextStyle(
            color: AppColor.greytextColor,
            fontFamily: 'CSB',
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
