import 'package:flutter/material.dart';

// Builds the refrigerator shelf composed of back panel, glass, and body.
Widget buildShelf() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: const [BackOfTheRefrigerator(), ShelfGlass(), ShelfBody()],
  );
}

// Shelf body section (bottom strip).
class ShelfBody extends StatelessWidget {
  const ShelfBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.grey[100]),
    );
  }
}

// Shelf glass section
class ShelfGlass extends StatelessWidget {
  const ShelfGlass({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: ShapeDecoration(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(60),
            topRight: const Radius.circular(60),
          ),
        ),
        color: Colors.blue.withOpacity(0.04),
      ),
    );
  }
}

/// Back panel of the refrigerator with side shadows.
class BackOfTheRefrigerator extends StatelessWidget {
  const BackOfTheRefrigerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 80),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 231, 231, 231),
        boxShadow: [
          // Right side shadow (soft)
          BoxShadow(
            color: Colors.grey.withOpacity(0.11),
            blurRadius: 16,
            spreadRadius: -4,
            offset: const Offset(24, 0),
          ),
          // Left side shadow (soft)
          BoxShadow(
            color: Colors.grey.withOpacity(0.11),
            blurRadius: 16,
            spreadRadius: -4,
            offset: const Offset(-24, 0),
          ),
        ],
      ),
      child: Row(
        children: const [
          SideShadow(offset: Offset(10, 0)),
          Spacer(),
          SideShadow(offset: Offset(-10, 0)),
        ],
      ),
    );
  }
}

// Reusable side shadow widget for left/right edges.
class SideShadow extends StatelessWidget {
  final Offset offset;
  const SideShadow({super.key, required this.offset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 28,
            spreadRadius: -4,
            offset: offset,
          ),
        ],
      ),
    );
  }
}
