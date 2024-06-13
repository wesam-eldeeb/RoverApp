import 'package:flutter/material.dart';

class TextFormVerivecation extends StatelessWidget {
  bool? obscureText;

  TextFormVerivecation({
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      textAlign: TextAlign.center,
      cursorColor: Colors.red,
      maxLength: 1,
      obscureText: obscureText!,
      decoration: InputDecoration(
        labelStyle: theme.textTheme.bodyMedium, //

        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }
}
