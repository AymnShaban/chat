import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text,this.onTap});
  String text;
  GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 40,left: 40),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 32, 141, 88),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "myfont",
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
