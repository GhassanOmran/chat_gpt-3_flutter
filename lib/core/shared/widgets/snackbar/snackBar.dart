import 'package:flutter/material.dart';

ScaffoldFeatureController snackBar(String text, BuildContext context,
    {Icon? icon, Color? backgroundColor}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 65),
      duration: const Duration(seconds: 2),
      content: Row(
        children: [
          icon ??
              const SizedBox(
                width: 10,
              ),
          Text(text),
        ],
      )));
}
