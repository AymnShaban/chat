import 'package:flutter/material.dart';

class MainTexts extends StatelessWidget {
  MainTexts({
    super.key,
    this.fontSize,this.fontWeight, this.color,this.fontFamily,this.text
  });

  String? fontFamily, text;
  Color? color  ;
  FontWeight? fontWeight ;
  double? fontSize;
  @override
  Widget build(BuildContext context) {
    return  Text(text!, style: TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,


    ),maxLines: 300,overflow: TextOverflow.ellipsis,softWrap: true,);
  }
}