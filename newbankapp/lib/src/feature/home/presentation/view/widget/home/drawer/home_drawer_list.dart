import 'package:flutter/material.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/home/drawer/list_items/return_button.dart';

class HomeDrawerList extends StatelessWidget {
  const HomeDrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(children: [
        ReturnButton(),
      ]),
    );
  }
}
