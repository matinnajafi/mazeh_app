import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/refrigerator_widgets/refrigerator_door_widget.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/refrigerator_widgets/refrigerator_shelf_widget.dart';

class RefrigeratorScreen extends StatefulWidget {
  const RefrigeratorScreen({super.key});

  @override
  State<RefrigeratorScreen> createState() => _RefrigeratorScreenState();
}

class _RefrigeratorScreenState extends State<RefrigeratorScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _leftDoorAnimation;
  late Animation<double> _rightDoorAnimation;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _leftDoorAnimation = Tween<double>(begin: 0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

    _rightDoorAnimation = Tween<double>(begin: 0, end: -1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );
  }

  void _toggleDoors() {
    if (_isOpen) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isOpen = !_isOpen;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        children: [
          // Refrigerator interior
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildShelf(color: Colors.blue[100]),
                  buildShelf(color: Colors.green[100]),
                  buildShelf(color: Colors.orange[100]),
                ],
              ),
            ),
          ),

          // Left door
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Transform(
                  alignment: Alignment.centerLeft,
                  transform:
                      Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_leftDoorAnimation.value),
                  child: RefrigeratorDoorWidget(
                    width: size.width / 2,
                    isLeft: true,
                    onTap: _toggleDoors,
                  ),
                ),
              );
            },
          ),

          // Right door
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Align(
                alignment: Alignment.centerRight,
                child: Transform(
                  alignment: Alignment.centerRight,
                  transform:
                      Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_rightDoorAnimation.value),
                  child: RefrigeratorDoorWidget(
                    width: size.width / 2,
                    isLeft: false,
                    onTap: _toggleDoors,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
