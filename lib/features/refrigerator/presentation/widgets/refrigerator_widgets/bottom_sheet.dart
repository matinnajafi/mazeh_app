import 'package:flutter/material.dart';
import 'package:mazeh_app/features/home/presentation/widgets/search_box.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/refrigerator_widgets/dialog/filter_dialog.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/refrigerator_widgets/ingredient_card.dart';

class AddItemBottomSheet extends StatelessWidget {
  const AddItemBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = (width ~/ 120).clamp(2, 6);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.8,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              const DragHandle(),
              const SizedBox(height: 16),
              SearchBox(onFilterTap: () => showFilterDialog(context)),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => const IngredientItem(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
