import 'dart:ui';

import 'package:flutter/material.dart';

class GlassActionButton extends StatelessWidget {
  final String asset;
  final EdgeInsets padding;
  final double size;
  final VoidCallback? onTap;

  const GlassActionButton({
    super.key,
    required this.asset,
    this.padding = const EdgeInsets.all(8),
    this.size = 42,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Padding(padding: padding, child: Image.asset(asset)),
          ),
        ),
      ),
    );
  }
}
