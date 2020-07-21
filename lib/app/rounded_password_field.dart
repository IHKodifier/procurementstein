import 'package:flutter/material.dart';
import 'package:procuremenstein/app/text_field_container.dart';
import 'package:procuremenstein/app/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;
  const RoundedPasswordField({
    Key key,
    this.onChanged, this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: textEditingController,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: appPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: appPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: appPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}