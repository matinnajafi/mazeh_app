import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class LetsCookButton extends StatelessWidget {
  const LetsCookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: AppColor.red,
        overlayColor: Colors.white,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(44),
        ),
      ),
      onPressed: () {},
      child: Text(
        'بپزیمممم',
        style: TextStyle(color: Colors.white, fontFamily: 'CSB', fontSize: 16),
      ),
    );
  }
}
