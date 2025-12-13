import 'package:flutter/material.dart';

class SuggestionFoodButton extends StatelessWidget {
  const SuggestionFoodButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStatePropertyAll<Size>(Size(140, 44)),
        backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
        shape: WidgetStateProperty.all(RoundedRectangleBorder()),
      ),
      onPressed: () {
        // navigate to suggestion food screen (with ingredients)
        // show food recipes
        // or...
      },
      child: const Text(
        textAlign: TextAlign.center,
        'چی میشه پخت؟',
        style: TextStyle(color: Colors.white, fontFamily: 'CSB', fontSize: 10),
      ),
    );
  }
}
