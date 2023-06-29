import 'package:flutter/material.dart';

class NewBankBoxCard extends StatelessWidget {
  final Widget boxContent;
  const NewBankBoxCard({Key? key, required this.boxContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Ink(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: kElevationToShadow[3],
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        child: boxContent,
      ),
    );
  }
}
