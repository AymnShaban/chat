import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    backgroundColor: const Color.fromARGB(255, 32, 141, 88),
    showCloseIcon: true,
  ));
}
