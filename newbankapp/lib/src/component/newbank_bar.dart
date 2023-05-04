import 'package:flutter/material.dart';

class NewBankBar extends AppBar {
  NewBankBar({
    super.key,
    super.title = const Text(
      "NW",
      style: TextStyle(
        fontFamily: "Cormorant",
        fontWeight: FontWeight.bold,
        fontSize: 42,
      ),
    ),
    super.elevation = 5,
    super.centerTitle = true,
    super.bottom,
    super.backgroundColor = Colors.indigo,
    super.automaticallyImplyLeading = true,
  });
}
