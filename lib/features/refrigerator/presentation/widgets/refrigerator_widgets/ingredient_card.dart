import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 80,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.85),
                Colors.blue.withOpacity(0.5),
              ],
              stops: const [0.0, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12, top: 12),
                  child: Image.asset('images/shrimp.png'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text(
                      'میگو',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'CM',
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      '۵۰۰ گرم',
                      style: TextStyle(
                        color: Color.fromARGB(255, 229, 229, 229),
                        fontFamily: 'CM',
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
