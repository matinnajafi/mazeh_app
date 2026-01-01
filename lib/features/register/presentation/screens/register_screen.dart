import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mazeh_app/features/register/presentation/widgets/food_list_header.dart';
import 'package:mazeh_app/features/register/presentation/widgets/register_footer_section.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

enum ScrollDirection { right, left }

class _RegisterScreenState extends State<RegisterScreen> {
  final ScrollController _controllerRight = ScrollController();
  final ScrollController _controllerLeft = ScrollController();

  Timer? _timerRight;
  Timer? _timerLeft;

  // Constants for smooth movement
  static const Duration scrollInterval = Duration(milliseconds: 100);
  static const double scrollSpeed = 0.2;

  @override
  void initState() {
    super.initState();
    _startAutoScroll(_controllerRight, direction: ScrollDirection.right);
    _startAutoScroll(_controllerLeft, direction: ScrollDirection.left);
  }

  void _startAutoScroll(
    ScrollController controller, {
    required ScrollDirection direction,
  }) {
    final int dir = direction == ScrollDirection.right ? 1 : -1;

    Timer timer = Timer.periodic(scrollInterval, (_) {
      if (!controller.hasClients) return;

      final double newOffset = controller.offset + dir * scrollSpeed;

      if (newOffset >= controller.position.maxScrollExtent) {
        controller.jumpTo(0);
      } else if (newOffset <= 0) {
        controller.jumpTo(controller.position.maxScrollExtent);
      } else {
        controller.jumpTo(newOffset);
      }
    });

    if (direction == ScrollDirection.right) {
      _timerRight = timer;
    } else {
      _timerLeft = timer;
    }
  }

  @override
  void dispose() {
    _timerRight?.cancel();
    _timerLeft?.cancel();
    _controllerRight.dispose();
    _controllerLeft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FoodListHeader(
              controllerRight: _controllerRight,
              controllerLeft: _controllerLeft,
            ),
            const RegisterFooterSection(),
          ],
        ),
      ),
    );
  }
}
