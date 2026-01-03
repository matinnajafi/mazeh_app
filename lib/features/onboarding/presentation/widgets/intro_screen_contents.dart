import 'package:flutter/material.dart';

class IntroScreenContents extends StatelessWidget {
  const IntroScreenContents({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Image.asset('images/$imagePath'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 34, left: 34, bottom: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'CB',
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  subtitle,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'CM',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
