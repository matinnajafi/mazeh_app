import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class DialogActions extends StatelessWidget {
  final bool hasSelection;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const DialogActions({
    super.key,
    required this.hasSelection,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColor.greytextColor, width: 1.2),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: onCancel,
              child: const Text(
                'انصراف',
                style: TextStyle(
                  color: AppColor.greytextColor,
                  fontFamily: 'CSB',
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    hasSelection ? AppColor.red : AppColor.greytextColor,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
              onPressed: onConfirm,
              child: Text(
                'تایید',
                style: TextStyle(
                  color: hasSelection ? Colors.white : AppColor.backgroundColor,
                  fontFamily: 'CSB',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
