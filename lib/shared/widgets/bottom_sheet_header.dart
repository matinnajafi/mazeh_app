import 'package:flutter/material.dart';

class BottomSheetHeader extends StatelessWidget {
  final double height;
  final Color color;
  final double radius;
  final bool showLeftRadius;
  final bool showRightRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  const BottomSheetHeader({
    super.key,
    this.height = 16,
    this.color = Colors.white,
    this.radius = 44.0,
    this.showLeftRadius = true,
    this.showRightRadius = true,
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: showLeftRadius ? Radius.circular(radius) : Radius.zero,
          topRight: showRightRadius ? Radius.circular(radius) : Radius.zero,
        ),
      ),
      child: child,
    );
  }
}
