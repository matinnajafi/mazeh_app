import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class TileDivider extends StatelessWidget {
  const TileDivider({super.key, this.endIndent = 0});
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.5,
      color: AppColor.backgroundColor,
      endIndent: endIndent,
    );
  }
}
