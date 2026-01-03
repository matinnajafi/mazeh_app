import 'package:flutter/material.dart';

// Custom clipper for curved AppBar bottom
class DynamicAppBarClipper extends CustomClipper<Path> {
  final double bottomLeft;
  final double bottomRight;

  DynamicAppBarClipper({required this.bottomLeft, required this.bottomRight});

  @override
  Path getClip(Size size) {
    final path = Path();

    // Move down to start left curve
    path.lineTo(0, size.height - bottomLeft);

    // Draw bottom curve
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - bottomRight,
    );

    // Close shape on the right side
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant DynamicAppBarClipper oldClipper) {
    // Reclip if curve values changed
    return oldClipper.bottomLeft != bottomLeft ||
        oldClipper.bottomRight != bottomRight;
  }
}
