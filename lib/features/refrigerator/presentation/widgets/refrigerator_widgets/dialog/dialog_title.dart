import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class DialogTitle extends StatelessWidget {
  final bool hasSelection;
  final VoidCallback onClear;

  const DialogTitle({
    super.key,
    required this.hasSelection,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('گروه غذایی', style: TextStyle(fontFamily: 'CSB')),
          if (hasSelection)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                minimumSize: const Size(80, 30),
                backgroundColor: AppColor.red.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                splashFactory: NoSplash.splashFactory,
              ).copyWith(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                shadowColor: WidgetStateProperty.all(Colors.transparent),
              ),
              onPressed: onClear,
              child: const Text(
                'حذف همه',
                style: TextStyle(
                  color: AppColor.red,
                  fontFamily: 'CM',
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
