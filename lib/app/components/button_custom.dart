import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final double width;
  final double height;
  final Color buttonColor;
  final String label;
  final TextStyle textStyle;
  final Color labelColor;
  final double labelSize;
  final Function onPressed;

  const ButtonCustom(
      {Key key,
      this.width,
      this.height,
      this.buttonColor,
      this.label,
      this.textStyle,
      this.labelColor,
      this.labelSize,
      this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          label,
          style: textStyle ?? TextStyle(color: labelColor, fontSize: labelSize),
        ),
        color: buttonColor,
        onPressed: onPressed,
      ),
    );
  }
}
