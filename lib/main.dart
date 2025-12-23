import 'package:flutter/material.dart';
import 'package:mazeh_app/features/recipe/presentation/screens/recipe_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: RecipeScreen());
  }
}
