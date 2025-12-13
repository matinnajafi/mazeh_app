import 'package:flutter/material.dart';
import 'package:mazeh_app/features/refrigerator/presentation/screens/fridge_monitor.dart';

class RefrigeratorDoorWidget extends StatelessWidget {
  final double width;
  final bool isLeft;
  final VoidCallback onTap;

  const RefrigeratorDoorWidget({
    super.key,
    required this.width,
    required this.isLeft,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFD9D9D9), Color(0xFFBFBFBF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Simulated thickness (inner edge strip)
            Align(
              alignment: isLeft ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(width: 6, color: Colors.black26),
            ),

            // Steel Handle
            Align(
              alignment: isLeft ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 120,
                  horizontal: 20,
                ),
                width: 16,
                height: 180,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.grey, Colors.black54],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            // fridge Monitor (on right door only)
            if (!isLeft)
              const Positioned(top: 40, left: 50, child: SmartFridgeMonitor()),
          ],
        ),
      ),
    );
  }
}
