import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';

class AddRecipeScreen extends StatelessWidget {
  const AddRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(child: const Center(child: Text('Add Recipe Screen'))),
    );
  }
}
