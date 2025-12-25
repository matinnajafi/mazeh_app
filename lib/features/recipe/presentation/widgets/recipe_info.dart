import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class RecipeDescription extends StatelessWidget {
  const RecipeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.right,
      'پاستا یکی از غذاهای کلاسیک ایتالیایی است که از دهه‌های گذشته وارد سفره‌های مردم شد و به‌تدریج جایگاه ویژه‌ای در آشپزی جهان پیدا کرد. ترکیب ساده اما خوش‌طعم آن باعث شد خانواده‌های اروپایی به‌سرعت به پخت این غذا روی بیاورند. امروزه پاستا به‌عنوان یکی از محبوب‌ترین غذاهای ایتالیا شناخته می‌شود و در بسیاری از شهرهای دنیا با سبک‌ها و سس‌های مختلف سرو می‌شود',
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
        Container(
          padding: const EdgeInsets.only(top: 2, bottom: 3, left: 8, right: 10),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 8,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '۴ دیدگاه',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: 'CM',
                  fontSize: 11,
                ),
              ),
            ],
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
          padding: const EdgeInsets.only(top: 4),
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
