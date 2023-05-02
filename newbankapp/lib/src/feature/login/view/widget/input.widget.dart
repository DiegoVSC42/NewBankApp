import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  var label = "";
  var ctrl = TextEditingController();

  Input({
    required this.label,
    required this.ctrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 120,
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontFamily: "Big Shoulders Display"),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: ctrl,
            keyboardType: TextInputType.text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Big Shoulders Display"),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, style: BorderStyle.solid),
              ),
            ),
          ),
        )
      ],
    );
  }
}
