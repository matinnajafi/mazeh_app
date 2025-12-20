import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { success, error, warning }

void showAppToast({
  required BuildContext context,
  required String title,
  required ToastType type,
}) {
  final fToast = FToast();
  fToast.init(context);

  Color bg;
  switch (type) {
    case ToastType.success:
      bg = Colors.green.withOpacity(0.9);
      break;
    case ToastType.error:
      bg = Colors.red.withOpacity(0.9);
      break;
    case ToastType.warning:
      bg = Colors.orange.withOpacity(0.9);
      break;
  }

  final toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(24.0),
    ),
    child: Text(
      title,
      style: const TextStyle(
        fontFamily: 'CSB',
        fontSize: 14,
        color: Colors.white,
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}
