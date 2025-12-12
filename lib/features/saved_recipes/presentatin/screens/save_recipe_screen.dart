import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/saved_recipes/presentatin/widgets/filter_chips_list.dart';
import 'package:mazeh_app/features/saved_recipes/presentatin/widgets/save_screen_widget.dart';

class SaveRecipeScreen extends StatelessWidget {
  const SaveRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('دستورهای ذخیره‌شده'),
        backgroundColor: AppColor.red,
        titleTextStyle: const TextStyle(
          fontFamily: 'CSB',
          fontSize: 20,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Filter Chips
            const FilterChipsList(),
            // Recipe list as SliverList
            const UserSavedRecipes(),
          ],
        ),
      ),
    );
  }
}
