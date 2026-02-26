import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class FoodListHeader extends StatefulWidget {
  const FoodListHeader({super.key});

  @override
  State<FoodListHeader> createState() => _FoodListHeaderState();
}

class _FoodListHeaderState extends State<FoodListHeader> {
  late final ScrollController _controllerTop;
  late final ScrollController _controllerBottom;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controllerTop = ScrollController();
    _controllerBottom = ScrollController(
      initialScrollOffset: 5000,
    ); // big initial offset for smoother start

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (!mounted) return;

      // top list moves to the right (increasing offset)
      if (_controllerTop.hasClients) {
        double maxScroll = _controllerTop.position.maxScrollExtent;
        double current = _controllerTop.offset;
        if (current >= maxScroll) {
          _controllerTop.jumpTo(0);
        } else {
          _controllerTop.jumpTo(current + 0.3);
        }
      }

      // bottom list moves to the left (decreasing offset)
      if (_controllerBottom.hasClients) {
        double current = _controllerBottom.offset;
        if (current <= 0) {
          _controllerBottom.jumpTo(_controllerBottom.position.maxScrollExtent);
        } else {
          _controllerBottom.jumpTo(current - 0.3);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controllerTop.dispose();
    _controllerBottom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                _buildListView(_controllerTop, 'top'),
                _buildListView(_controllerBottom, 'bottom'),
              ],
            ),
          ),
          // gradient overlay for smoother fade effect at the bottom of the header
          _buildGradientOverlay(),
        ],
      ),
    );
  }

  Widget _buildListView(ScrollController controller, String keySuffix) {
    return Expanded(
      child: ListView.builder(
        key: ValueKey('auto_list_$keySuffix'),
        controller: controller,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1000,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Container(
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('images/recipe.png'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return IgnorePointer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.backgroundColor,
              AppColor.backgroundColor.withValues(alpha: 0.8),
              AppColor.backgroundColor.withValues(alpha: 0.0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.0, 0.3, 0.7],
          ),
        ),
      ),
    );
  }
}
