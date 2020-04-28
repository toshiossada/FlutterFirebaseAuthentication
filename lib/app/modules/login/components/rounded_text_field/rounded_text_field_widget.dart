import 'package:flutter/material.dart';

class RoundedTextFieldWidget extends StatelessWidget {
  final Function onSaved;
  final Function validator;
  final Function onTap;
  final Function onChanged;
  final String labelText;
  final String initialValue;
  final TextEditingController controller;
  final bool readOnly;
  final bool obscureText;
  final int maxLines;
  final Color backgroundColor;
  final Color fontColor;
  final Widget suffixIcon;
  final bool showBorder;
  final Color labelStyleColor;

  RoundedTextFieldWidget({
    Key key,
    this.onSaved,
    this.validator,
    this.onTap,
    this.onChanged,
    this.labelText,
    this.initialValue,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.backgroundColor = Colors.transparent,
    @required this.fontColor,
    this.suffixIcon,
    this.showBorder = true,
    this.labelStyleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        maxLines: maxLines,
        style: TextStyle(color: fontColor),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          border: showBorder ? null : InputBorder.none,
          suffixIcon: suffixIcon,
          fillColor: Colors.greenAccent,
          labelText: labelText,
          labelStyle: TextStyle(
            color: labelStyleColor == null
                ? Theme.of(context).accentColor
                : labelStyleColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        validator: validator,
        onTap: onTap,
        onSaved: onSaved ?? (v) {},
        onChanged: onChanged ?? (v) {},
      ),
    );
  }
}
