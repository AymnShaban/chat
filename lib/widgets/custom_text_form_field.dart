import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, this.hintText,this.onChange, this.validator,this.labelText,this.autofillHints, this.obscureText = false});
  String? hintText;
  String? labelText;
  bool obscureText;
  Iterable<String>? autofillHints;
  Function(String)? onChange;
  FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      autocorrect: true,
      autofocus: true,
      validator: validator,
      autofillHints: autofillHints,
      onChanged: onChange,
      style: const TextStyle(
          color: Colors.white
      ),
      decoration: InputDecoration(
          labelText:labelText,
          hintText: hintText,
          labelStyle: const TextStyle(color: Colors.white),
          errorStyle: TextStyle(color: Colors.cyanAccent),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyanAccent)),
          hintStyle: const TextStyle(
            color: Colors.white,
            fontFamily: "myfont",
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 32, 141, 88))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 32, 141, 88)))),

    );
  }
}
