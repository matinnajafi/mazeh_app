import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class NutritionExpandableList extends StatefulWidget {
  const NutritionExpandableList({super.key});

  @override
  State<NutritionExpandableList> createState() =>
      _NutritionExpandableListState();
}

class _NutritionExpandableListState extends State<NutritionExpandableList> {
  bool isExpanded = false;

  final items = List.generate(12, (i) => const NutritionItem());

  static const double itemWidth = 65;
  static const double itemSpacing = 12;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final double fullItemWidth = itemWidth + itemSpacing;

        final int itemsPerRow =
            fullItemWidth == 0 ? items.length : maxWidth ~/ fullItemWidth;

        final bool hasOverflow = itemsPerRow > 0 && items.length > itemsPerRow;

        final collapsedItems =
            hasOverflow ? items.take(itemsPerRow).toList() : items;

        /// Safe row width (prevents negative values)
        final double rowWidth =
            collapsedItems.isEmpty
                ? 0
                : collapsedItems.length * itemWidth +
                    (collapsedItems.length - 1) * itemSpacing;

        return Stack(
          children: [
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              crossFadeState:
                  isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,

              /// COLLAPSED → Row
              firstChild: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < collapsedItems.length; i++) ...[
                    SizedBox(width: itemWidth, child: collapsedItems[i]),
                    if (i != collapsedItems.length - 1)
                      const SizedBox(width: itemSpacing),
                  ],
                ],
              ),

              /// EXPANDED → Wrap (width locked to rowWidth)
              secondChild: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: rowWidth,
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    spacing: itemSpacing,
                    runSpacing: 12,
                    children: [
                      for (final item in items)
                        SizedBox(width: itemWidth, child: item),
                    ],
                  ),
                ),
              ),
            ),

            /// Shadow + Arrow (only when collapsed AND overflow exists)
            if (hasOverflow && !isExpanded)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => setState(() => isExpanded = true),
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.white, Colors.white.withOpacity(0.0)],
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 28,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class NutritionItem extends StatelessWidget {
  const NutritionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'پروتئین',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'CSB',
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '۱۰۰ گرم',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.grey[600],
                fontFamily: 'CM',
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 4),
            SizedBox(
              height: 22,
              width: 22,
              child: Image.asset('images/protein.png'),
            ),
          ],
        ),
      ],
    );
  }
}

class RecipeNutritionTitle extends StatelessWidget {
  const RecipeNutritionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'ارزش غذایی',
      textAlign: TextAlign.end,
      style: TextStyle(
        color: AppColor.greytextColor,
        fontFamily: 'CSB',
        fontSize: 13,
      ),
    );
  }
}
