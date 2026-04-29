import 'package:flutter/material.dart';

abstract class CustomSnackBars {
  static void showSnackbar(
    BuildContext context, {
    required String title,
    Color? errorColor,
    int? showSeconds,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        behavior: SnackBarBehavior.floating,
        backgroundColor: errorColor ?? Colors.green,
        duration: Duration(seconds: showSeconds ?? 2),
      ),
    );
  }
}
