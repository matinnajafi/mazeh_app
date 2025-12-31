import 'package:flutter/material.dart';
import 'package:mazeh_app/core/constants/app_color.dart';
import 'package:mazeh_app/features/add_recipes/presentation/widgets/add_ingredients_box.dart';
import 'package:mazeh_app/features/add_recipes/presentation/widgets/add_recipe_image.dart';
import 'package:mazeh_app/features/add_recipes/presentation/widgets/add_recipe_info.dart';
import 'package:mazeh_app/features/add_recipes/presentation/widgets/add_recipe_steps.dart';
import 'package:mazeh_app/features/add_recipes/presentation/widgets/animated_dropdown_field.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  String? selectedMeal;
  String? selectedDifficulty;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<String> meals = [
      'صبحانه',
      'ناهار',
      'شام',
      'میان وعده',
      'دسر',
      'نوشیدنی',
    ];

    final List<String> difficulty = ['آسان', 'متوسط', 'دشوار'];

    final List<String> times = [
      '15 دقیقه',
      '30 دقیقه',
      '45 دقیقه',
      '1 ساعت',
      '1 ساعت و نیم',
      '2 ساعت',
      'بیشتر از 2 ساعت',
    ];

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('افزودن دستور'),
        titleTextStyle: TextStyle(
          color: AppColor.red,
          fontFamily: 'CSB',
          fontSize: 18,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Fixed red line below the app bar
            Container(height: 4, width: size.width, color: AppColor.red),

            // Scrollable content
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // ---------------- IMAGE SECTION ----------------
                  const SliverToBoxAdapter(child: AddRecipeImageTitle()),
                  SliverToBoxAdapter(child: AddRecipeImageField(size: size)),
                  const SliverToBoxAdapter(child: RecipeImageList()),

                  // ---------------- NAME SECTION ----------------
                  const SliverToBoxAdapter(child: AddRecipeNameTitle()),
                  const SliverToBoxAdapter(child: AddRecipeNameTextField()),

                  // ---------------- DESCRIPTION SECTION ----------------
                  const SliverToBoxAdapter(child: AddRecipeDescriptionTitle()),
                  const SliverToBoxAdapter(
                    child: AddRecipeDescriptionTextField(),
                  ),

                  // ---------------- MEAL DROPDOWN ----------------
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: AnimatedDropdownField(
                        title: 'وعده غذایی',
                        items: meals,
                        value: selectedMeal,
                        onChanged: (value) {
                          setState(() => selectedMeal = value);
                        },
                      ),
                    ),
                  ),

                  // ---------------- DIFFICULTY + TIME ----------------
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AnimatedDropdownField(
                              title: 'سطح سختی',
                              items: difficulty,
                              value: selectedDifficulty,
                              onChanged: (value) {
                                setState(() => selectedDifficulty = value);
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: AnimatedDropdownField(
                              title: 'زمان آماده سازی',
                              items: times,
                              value: selectedTime,
                              onChanged: (value) {
                                setState(() => selectedTime = value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 24)),

                  // ---------------- INGREDIENTS BOX ----------------
                  SliverToBoxAdapter(child: AddIngredientsBox(size: size)),
                  const SliverToBoxAdapter(child: SizedBox(height: 12)),

                  // ---------------- STEPS BOX ----------------
                  SliverToBoxAdapter(child: AddRecipeSteps()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
