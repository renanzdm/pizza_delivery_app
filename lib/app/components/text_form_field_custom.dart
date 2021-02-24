import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String label;
  final Icon suffixIcon;
  final Function suffixIconOnPressed;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;

  const TextFormFieldCustom(
      {Key key,
      this.label,
      this.suffixIcon,
      this.suffixIconOnPressed,
      this.obscureText = false,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          labelText: label,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: suffixIcon,
                  color: Theme.of(context).primaryColor,
                  onPressed: suffixIconOnPressed,
                )
              : null),
      obscureText: obscureText,
    );
  }
}
