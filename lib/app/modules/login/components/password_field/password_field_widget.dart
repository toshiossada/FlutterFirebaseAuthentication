import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../rounded_text_field/rounded_text_field_widget.dart';
import 'password_field_controller.dart';

class PasswordFieldWidget extends StatefulWidget {
  final Function onChanged;
  final String label;
  final Function validator;
  final Color fontColor;
  PasswordFieldWidget(
      {this.onChanged, @required this.label, this.validator, this.fontColor});
  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState
    extends ModularState<PasswordFieldWidget, PasswordFieldController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (_) => RoundedTextFieldWidget(
          labelText: widget.label,
          fontColor: widget.fontColor,
          backgroundColor: Colors.transparent,
          obscureText: !controller.passwordVisible,
          onChanged: widget.onChanged,
          validator: widget.validator,
          suffixIcon: IconButton(
            onPressed: () {
              controller.passwordVisible = !controller.passwordVisible;
            },
            icon: Icon(
              controller.passwordVisible
                  ? FontAwesomeIcons.eyeSlash
                  : FontAwesomeIcons.eye,
              color: Theme.of(context).accentColor.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }
}
