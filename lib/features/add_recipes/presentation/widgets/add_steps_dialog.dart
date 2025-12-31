import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class AddStepsDialog extends StatefulWidget {
  final void Function(String title, String desc) onSubmit;

  const AddStepsDialog({super.key, required this.onSubmit});

  @override
  State<AddStepsDialog> createState() => _AddStepsDialogState();
}

class _AddStepsDialogState extends State<AddStepsDialog> {
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();

  bool titleError = false;
  bool descError = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'افزودن مرحله جدید',
              style: TextStyle(fontFamily: 'CB', fontSize: 18),
            ),
          ),

          // title field
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: titleError ? Colors.red : Colors.transparent,
                width: 1.2,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              controller: titleCtrl,
              textAlign: TextAlign.right,
              style: const TextStyle(fontFamily: 'CM', fontSize: 14),
              decoration: InputDecoration(
                hintText: 'عنوان مرحله',
                hintStyle: TextStyle(
                  fontFamily: 'CM',
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // description field
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: descError ? Colors.red : Colors.transparent,
                width: 1.2,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              controller: descCtrl,
              textAlign: TextAlign.right,
              maxLines: 4,
              style: const TextStyle(fontFamily: 'CM', fontSize: 14),
              decoration: InputDecoration(
                hintText: 'توضیحات مرحله',
                hintStyle: TextStyle(
                  fontFamily: 'CM',
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // buttons
          Row(
            children: [
              // submit
              Expanded(
                child: InkWell(
                  onTap: () {
                    bool hasError = false;

                    if (titleCtrl.text.isEmpty) {
                      hasError = true;
                      setState(() => titleError = true);
                    } else {
                      setState(() => titleError = false);
                    }

                    if (descCtrl.text.isEmpty) {
                      hasError = true;
                      setState(() => descError = true);
                    } else {
                      setState(() => descError = false);
                    }

                    if (hasError) return;

                    Navigator.pop(context);

                    widget.onSubmit(titleCtrl.text, descCtrl.text);
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColor.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'ثبت',
                      style: TextStyle(
                        fontFamily: 'CB',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // cancel
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.red, width: 1.4),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'انصراف',
                      style: TextStyle(
                        fontFamily: 'CB',
                        fontSize: 14,
                        color: AppColor.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
