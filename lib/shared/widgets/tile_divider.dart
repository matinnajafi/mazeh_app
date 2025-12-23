import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class TileDivider extends StatelessWidget {
  const TileDivider({super.key, this.endIndent = 0, this.thickness = 0.5});
  final double endIndent;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: AppColor.backgroundColor,
      endIndent: endIndent,
    );
  }
}
