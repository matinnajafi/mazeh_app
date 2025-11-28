import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mazeh_app/constants/app_color.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: SizedBox(
        height: 240,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return RecipeCardWidget();
            },
          ),
        ),
      ),
    );
  }
}

class RecipeCardWidget extends StatelessWidget {
  const RecipeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 14),
      height: 240,
      width: 175,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/recipe.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24),
        color: Colors.blue,
      ),
      child: const Stack(
        children: [
          BlackGradient(),
          Column(children: [_Header(), Spacer(), _Footer()]),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  // ignore: unused_element_parameter
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'جوجه کباب با سبزیجات',
            style: TextStyle(
              fontFamily: 'CSB',
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '30 ',
                      style: TextStyle(
                        fontFamily: 'CSB',
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: 'دقیقه',
                      style: TextStyle(
                        fontFamily: 'CSB',
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: '  |  ',
                      style: TextStyle(
                        fontFamily: 'CSB',
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                textDirection: TextDirection.rtl,
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 1,
                  bottom: 3,
                  left: 12,
                  right: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.25),
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
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  // ignore: unused_element_parameter
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'ناهار',
                    style: TextStyle(fontFamily: 'CSB', color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlackGradient extends StatelessWidget {
  const BlackGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black.withOpacity(0.5), Colors.transparent],
        ),
      ),
    );
  }
}

class RecipeListTitle extends StatelessWidget {
  const RecipeListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
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
            'دستورهای پربازدید',
            style: TextStyle(fontSize: 18, fontFamily: 'CSB'),
          ),
        ],
      ),
    );
  }
}
