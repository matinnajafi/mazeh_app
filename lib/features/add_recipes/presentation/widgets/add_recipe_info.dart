import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class AddRecipeDescriptionTextField extends StatelessWidget {
  const AddRecipeDescriptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: TextField(
          maxLines: 4,
          style: const TextStyle(
            fontFamily: 'CM',
            fontSize: 14,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: 'توضیحات غذا را وارد کنید ...',
            hintStyle: const TextStyle(
              fontFamily: 'CM',
              fontSize: 14,
              color: AppColor.greytextColor,
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class AddRecipeDescriptionTitle extends StatelessWidget {
  const AddRecipeDescriptionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 10, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text('توضیحات', style: TextStyle(fontFamily: 'CSB', fontSize: 14)),
          SizedBox(width: 6),
          Icon(Icons.description_rounded, size: 18, color: AppColor.red),
        ],
      ),
    );
  }
}

class AddRecipeNameTextField extends StatelessWidget {
  const AddRecipeNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: TextField(
          style: const TextStyle(
            fontFamily: 'CM',
            fontSize: 14,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: 'نام غذا را وارد کنید',
            hintStyle: const TextStyle(
              fontFamily: 'CM',
              fontSize: 14,
              color: AppColor.greytextColor,
            ),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class AddRecipeNameTitle extends StatelessWidget {
  const AddRecipeNameTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text('نام غذا', style: TextStyle(fontFamily: 'CSB', fontSize: 14)),
          SizedBox(width: 6),
          Icon(Icons.edit, size: 18, color: AppColor.red),
        ],
      ),
    );
  }
}
