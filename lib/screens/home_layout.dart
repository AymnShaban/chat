import 'package:flutter/material.dart';

class HimsHome extends StatelessWidget {
  const HimsHome({super.key});
  static String id = "HimsHome";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            return Navigator.pop(context);
          },
          icon: const Icon(Icons.back_hand),
        ),
      ),
      body: const Image(
        image: AssetImage("assets/images/e1.png"),
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
