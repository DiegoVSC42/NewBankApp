import 'package:flutter/material.dart';

class NewBankTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final ButtonStyle? style;
  final Widget? child;

  const NewBankTextButton({
    super.key,
    required this.onPressed,
    this.style,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(
          Colors.white.withOpacity(.5),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.indigo,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Colors.white,
            width: 0.25,
          ),
        ),
      ),
      onPressed: onPressed,
      child: child!,
    );
  }
}
