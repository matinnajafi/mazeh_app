import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 12,
            itemBuilder: (context, index) {
              return CategoryItemChip();
            },
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}

class CategoryItemChip extends StatelessWidget {
  const CategoryItemChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  blurRadius: 12,
                  spreadRadius: -16,
                  color: Colors.black,
                ),
              ],
              shape: CircleBorder(),
              color: Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset('images/kebab.png'),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          const Text(
            overflow: TextOverflow.ellipsis,
            'ایرانی',
            style: TextStyle(fontFamily: 'CSB', fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 24.0, left: 24, bottom: 12.0, top: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: Icon(Icons.arrow_back_ios, size: 12, color: AppColor.red),
          ),
          Text(
            'مشاهده همه',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'CSB',
              color: AppColor.red,
            ),
          ),
          Spacer(),
          Text(
            'دسته‌بندی ها',
            style: TextStyle(fontSize: 18, fontFamily: 'CSB'),
          ),
        ],
      ),
    );
  }
}
