import 'package:flutter/material.dart';

import '../screens/register_screen/register_screen.dart';

Widget textAndClickRow({required String? text,
  required String? click,
  required context,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RegisterScreen.id);
          },
          child:  Text(
            click!,
            style: const TextStyle(
              color: Color.fromARGB(255, 89, 188, 140),
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: "myfont",
            ),
          ),
        ),
      ],
    );
