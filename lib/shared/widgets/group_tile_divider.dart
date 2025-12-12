import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class GroupTileDivider extends StatelessWidget {
  const GroupTileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      decoration: const BoxDecoration(color: AppColor.backgroundColor),
    );
  }
}
