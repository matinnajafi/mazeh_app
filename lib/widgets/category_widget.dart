import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: 74,
                child: Column(
                  children: [
                    Container(
                      height: 52,
                      width: 52,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.blue.withOpacity(0.1),
                      ),
                      child: Center(
                        child: const Icon(
                          Icons.dinner_dining,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      overflow: TextOverflow.ellipsis,
                      'غذاهای ایرانی',
                      style: TextStyle(fontFamily: 'CSB', fontSize: 12),
                    ),
                  ],
                ),
              ),
            );
          },
          shrinkWrap: true,
        ),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 24.0, bottom: 12.0, top: 4.0),
      child: Text(
        'دسته‌بندی ها',
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 18, fontFamily: 'CSB'),
      ),
    );
  }
}
