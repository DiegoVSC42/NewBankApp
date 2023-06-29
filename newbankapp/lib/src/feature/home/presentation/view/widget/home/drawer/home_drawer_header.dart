import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:localization/localization.dart';

class HomeDrawerHeader extends StatefulWidget {
  Svg image;
  String username;
  String accountNumber;

  HomeDrawerHeader({
    super.key,
    required this.image,
    required this.username,
    required this.accountNumber,
  });

  @override
  State<HomeDrawerHeader> createState() => _HomeDrawerHeaderState();
}

class _HomeDrawerHeaderState extends State<HomeDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      height: 240,
      padding: EdgeInsets.only(top: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: widget.image,
            ),
          ),
        ),
        ListTile(
          title: Text(
            widget.username,
            textAlign: TextAlign.center,
          ),
          subtitle: Column(
            children: [
              Text(
                "agency".i18n() +
                    " 0001" +
                    " • " +
                    "account".i18n() +
                    " " +
                    widget.accountNumber,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              Text(
                "bank".i18n() +
                    " " +
                    "0420" +
                    " • " +
                    "Nw" +
                    " " +
                    "payment".i18n() +
                    " " "S.A." +
                    " - " +
                    "institution".i18n(),
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
