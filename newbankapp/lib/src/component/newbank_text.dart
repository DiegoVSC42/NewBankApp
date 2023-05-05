import 'package:flutter/material.dart';

class NewBankText extends Text {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;

  const NewBankText(
    this.data, {
    Key? key,
    this.style = const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.textAlign = TextAlign.center,
  }) : super(
          data,
          key: key,
          style: style,
          textAlign: textAlign,
        );
}
// Text(
//                   "Ja possui cadastro ?",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),