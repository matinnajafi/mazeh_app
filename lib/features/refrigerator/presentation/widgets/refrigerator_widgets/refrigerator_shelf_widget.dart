import 'package:flutter/material.dart';

Widget buildShelf({required Color? color}) {
  return Container(
    height: 80,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(color: color),
  );
}
