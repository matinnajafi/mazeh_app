import 'dart:math' as math;

import 'package:flutter/material.dart';

class FridgePinnedImage extends StatelessWidget {
  const FridgePinnedImage({
    super.key,
    required this.angle,
    required this.imageName,
  });
  final double angle;
  final String imageName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Transform.rotate(
          angle: angle,
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 4,
                left: 4,
                top: 4,
                bottom: 8,
              ),
              child: SizedBox(
                height: 44,
                width: 44,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset('images/$imageName'),
                ),
              ),
            ),
          ),
        ),
        // Red pin on top center
        Positioned(
          top: -14,
          left: 8,
          right: 0,
          child: SizedBox(
            height: 24,
            width: 24,
            child: Image.asset('images/pin.png'),
          ),
        ),
      ],
    );
  }
}

class GroupPinnedImage extends StatelessWidget {
  const GroupPinnedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 146,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            left: 6,
            top: 10,
            child: FridgePinnedImage(
              angle: -math.pi / 34,
              imageName: 'family.png',
            ),
          ),
          Positioned(
            left: 42,
            top: 40,
            child: FridgePinnedImage(
              angle: math.pi / 12,
              imageName: 'baby.png',
            ),
          ),
          Positioned(
            left: 14,
            top: 85,
            child: FridgePinnedImage(
              angle: -math.pi / 10,
              imageName: 'family2.png',
            ),
          ),
        ],
      ),
    );
  }
}
