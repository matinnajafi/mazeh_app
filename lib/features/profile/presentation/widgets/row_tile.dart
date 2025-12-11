import 'package:flutter/material.dart';

class RowTile extends StatelessWidget {
  final String title;
  final Widget? icon;
  final Widget? arrow;
  final VoidCallback onTap; // required callback

  const RowTile({
    super.key,
    required this.title,
    this.icon,
    this.arrow,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // tap handler
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            arrow ?? const Icon(Icons.arrow_left_rounded, color: Colors.grey),
            const Spacer(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'CM', fontSize: 12),
            ),
            const SizedBox(width: 8),
            icon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
