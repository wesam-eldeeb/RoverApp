import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final FormFieldValidator<String>? validator; //4
  final TextEditingController controller; //
  String? hintText; //1
  Icon? prefixIcon; //2
  var keyboardType; //3
  var onFieldSubmitted; //5
  bool? obscureText; //
  String labelText;

  //int maxLines; //

  TextFormFieldCustom({
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    required this.controller,
    //required this.maxLines,
    required this.keyboardType,
    this.onFieldSubmitted,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      cursorColor: Colors.red,
      controller: controller,
      validator: validator,
      //  maxLength: maxLines,
      obscureText: obscureText!,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        ////هي الي بتخلي لون الايقوانت حمرا
        //  prefixIconColor: theme.primaryColor,  //
        labelText: labelText,
        labelStyle: theme.textTheme.bodyMedium,
        //

        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }
}
