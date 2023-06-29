import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';

PreferredSizeWidget homeBar() {
  return NewBankBar(
    title: const Text(
      "NW",
      style: TextStyle(
        fontFamily: "Cormorant",
        fontWeight: FontWeight.bold,
        fontSize: 42,
      ),
    ),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
        child: SizedBox(
          height: 42,
          child: Row(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "hello".i18n(),
                  style: const TextStyle(
                    fontFamily: "Cormorant",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    automaticallyImplyLeading: true,
  );
}
