import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/refrigerator/domain/models/food_group.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/refrigerator_widgets/dialog/dialog_actions.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/refrigerator_widgets/dialog/dialog_checkbox_list.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/refrigerator_widgets/dialog/dialog_title.dart';
import 'package:mazeh_app/shared/widgets/toast_helper.dart';

/// Helper to show the filter dialog
void showFilterDialog(BuildContext context) {
  showDialog(context: context, builder: (_) => const FilterDialogContent());
}

/// Dialog content widget
class FilterDialogContent extends StatefulWidget {
  const FilterDialogContent({super.key});

  @override
  State<FilterDialogContent> createState() => _FilterDialogContentState();
}

class _FilterDialogContentState extends State<FilterDialogContent> {
  final Set<FoodGroup> selected = {};

  @override
  Widget build(BuildContext context) {
    final hasSelection = selected.isNotEmpty;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: AppColor.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: DialogTitle(
          hasSelection: hasSelection,
          onClear: () => setState(selected.clear),
        ),
        content: DialogCheckboxList(
          selected: selected,
          onChanged: (item, value) {
            setState(() {
              value ? selected.add(item) : selected.remove(item);
            });
          },
        ),
        actions: [
          DialogActions(
            hasSelection: hasSelection,
            onCancel: () => Navigator.pop(context),
            onConfirm: () {
              if (hasSelection) {
                // return names or full objects depending on your use case
                Navigator.pop(context, selected.map((e) => e.name).toList());
              } else {
                showAppToast(
                  title: 'حداقل یک گروه رو انتخاب کنید',
                  type: ToastType.error,
                  context: context,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
