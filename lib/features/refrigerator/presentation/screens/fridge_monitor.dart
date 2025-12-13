import 'package:flutter/material.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/fridge_monitor_widgets/fridge_grid.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/fridge_monitor_widgets/header_row_clock_weather.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/fridge_monitor_widgets/ingredient_slider.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/fridge_monitor_widgets/pinned_image.dart';
import 'package:mazeh_app/features/refrigerator/presentation/widgets/fridge_monitor_widgets/suggestion_food_button.dart';

class SmartFridgeMonitor extends StatelessWidget {
  const SmartFridgeMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // ignore: deprecated_member_use
            Colors.black.withOpacity(0.7),
            // ignore: deprecated_member_use
            Colors.black.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 6.0, right: 6.0, bottom: 24, top: 12),
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 6,
              children: const [
                // Clock with Weather badge
                HeaderRowClockWithWeather(),
                // Grid for food and health tips
                FridgeGrid(),
                // Images for save Memories
                GroupPinnedImage(),
                // To show ingredient in fridge
                IngredientSlider(),
                // To see the foods that are in the fridge with the ingredients
                SuggestionFoodButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
