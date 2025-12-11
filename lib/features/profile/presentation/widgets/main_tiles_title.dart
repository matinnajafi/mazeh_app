import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class MainTilesTitle extends StatelessWidget {
  const MainTilesTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, top: 10, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColor.greytextColor,
              fontFamily: 'CL',
            ),
          ),
        ],
      ),
    );
  }
}
