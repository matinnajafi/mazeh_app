import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/refrigerator/domain/models/food_group.dart';

class DialogCheckboxList extends StatelessWidget {
  final Set<FoodGroup> selected;
  final void Function(FoodGroup item, bool value) onChanged;

  const DialogCheckboxList({
    required this.selected,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 260,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: foodGroups.length,
        itemBuilder: (context, index) {
          final item = foodGroups[index];
          return CheckboxListTile(
            value: selected.contains(item),
            onChanged: (value) => onChanged(item, value ?? false),
            activeColor: AppColor.red,
            checkColor: Colors.white,
            title: Row(
              children: [
                Image.asset(item.iconPath, width: 28, height: 28),
                const SizedBox(width: 6),
                Text(
                  item.name,
                  style: const TextStyle(fontFamily: 'CSB', fontSize: 15),
                ),
              ],
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding: const EdgeInsets.only(right: 10),
          );
        },
      ),
    );
  }
}
