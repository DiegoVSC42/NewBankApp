import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class Input extends StatefulWidget {
  var label = "";
  var ctrl = TextEditingController();
  var regex = RegExp(r"");
  var obscureText = false;

  Input({
    required this.label,
    required this.ctrl,
    required this.regex,
    required this.obscureText,
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
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
              ),
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.indigo,
                ),
              ),
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Big Shoulders Display",
            ),
            // onTap: () async {
            //   _hintMode(widget.label);
            // },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "${widget.label} cannot be empty";
              }
              if (widget.regex.hasMatch(value)) {
                return null;
              }
              return "${widget.label} format mismatch";
            },
            obscureText: widget.obscureText,
          ),
        )
      ],
    );
  }

  // void _hintMode(String text) {
  //   String hintReturn = "";
  //   print(text);
  //   switch (text) {
  //     case "Firstname":
  //       {
  //         hintReturn = "firstname_ht_sup".i18n();
  //         _updateHint(hintReturn);
  //       }
  //       break;
  //     case "Lastname":
  //       {
  //         hintReturn = "lastname_ht_sup".i18n();
  //         _updateHint(hintReturn);
  //       }
  //       break;
  //     case "CPF":
  //       {
  //         hintReturn = "CPF_ht".i18n();
  //         _updateHint(hintReturn);
  //       }
  //       break;
  //     case "Username":
  //       {
  //         hintReturn = "username_ht_sup".i18n();
  //         _updateHint(hintReturn);
  //       }
  //       break;
  //     case "Password":
  //       {
  //         hintReturn = "password_ht_sup".i18n();
  //         _updateHint(hintReturn);
  //       }
  //       break;
  //     case "E-mail":
  //       {
  //         hintReturn = "email_ht".i18n();
  //         _updateHint(hintReturn);
  //       }
  //       break;
  //     case "Phone":
  //       {
  //         hintReturn = "phone_ht".i18n();
  //         _updateHint(hintReturn);
  //       }
  //   }
  // }

  // void _updateHint(String hintReturn) {
  //   setState(() {
  //     text = hintReturn;
  //   });
  // }
}
