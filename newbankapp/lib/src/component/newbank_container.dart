import 'package:flutter/material.dart';

class NewBankContainer extends Container {
  final double height;
  final double width;
  final BoxDecoration decoration;
  final Widget? child;

  NewBankContainer({
    super.key,
    this.height = 120,
    this.width = 420,
    this.decoration = const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration.copyWith(
        color: Colors.indigo.withOpacity(0.8),
      ),
      child: child,
    );
  }
}
