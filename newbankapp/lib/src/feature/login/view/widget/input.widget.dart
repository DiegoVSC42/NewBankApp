import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  var label = "";
  var ctrl = TextEditingController();

  Input({
    required this.label,
    required this.ctrl,
    super.key,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: widget.ctrl,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: "${widget.label}:",
              hintText: text,
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Big Shoulders Display",
            ),
            onTap: () async {
              _hintMode(widget.label);
            },
          ),
        )
      ],
    );
  }

  void _hintMode(String text) {
    String hintReturn = "";
    print(text);
    switch (text) {
      case "Firstname":
        {
          hintReturn = "Ex: Jorge";
          _updateHint(hintReturn);
        }
        break;
      case "Lastname":
        {
          hintReturn = "Ex: Silva";
          _updateHint(hintReturn);
        }
        break;
      case "CPF":
        {
          hintReturn = "123.456.789-01";
          _updateHint(hintReturn);
        }
        break;
      case "Username":
        {
          hintReturn = "Nome123";
          _updateHint(hintReturn);
        }
        break;
      case "Password":
        {
          hintReturn = "Minha_senha123";
          _updateHint(hintReturn);
        }
        break;
      case "E-mail":
        {
          hintReturn = "example@example.com";
          _updateHint(hintReturn);
        }
        break;
      case "Phone":
        {
          hintReturn = "(55)14565-1234";
          _updateHint(hintReturn);
        }
    }
  }

  void _updateHint(String hintReturn) {
    setState(() {
      text = hintReturn;
    });
  }
}
