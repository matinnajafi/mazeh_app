import 'package:flutter/material.dart';

class ImageBannersIndicator extends StatelessWidget {
  const ImageBannersIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 90,
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.5),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Center(
        child: Icon(Icons.more_horiz, color: Colors.grey.shade700, size: 26),
      ),
    );
  }
}
