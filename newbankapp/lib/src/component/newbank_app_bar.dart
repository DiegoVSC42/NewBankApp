import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class NewBankAppBar extends AppBar {
  NewBankAppBar({
    super.key,
    super.backgroundColor = Colors.indigo,
    super.title = const Text("Texto base"),
    super.elevation,
  });
  PreferredSizeWidget _newbankBar(String text) {
    return NewBankAppBar(
      title: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[400],
              image: const DecorationImage(
                image: Svg("lib/assets/images/user_placeholder.svg"),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Olá, 'USER_NAME'",
              style: TextStyle(
                fontFamily: "Cormorant",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      elevation: 5,
    );
  }
}
