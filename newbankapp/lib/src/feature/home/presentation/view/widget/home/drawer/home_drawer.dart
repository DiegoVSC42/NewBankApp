import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/home/drawer/home_drawer_header.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/home/drawer/home_drawer_list.dart';

class HomeDrawer extends StatelessWidget {
  Svg image;
  String username;
  String accountNumber;

  HomeDrawer(
      {Key? key,
      required this.image,
      required this.username,
      required this.accountNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          HomeDrawerHeader(
            image: image,
            username: username,
            accountNumber: accountNumber,
          ),
          HomeDrawerList(),
        ],
      ),
    );
  }
}
