import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/circular_button/circular_button_widget.dart';
import 'components/password_field/password_field_widget.dart';
import 'components/rounded_text_field/rounded_text_field_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          RoundedTextFieldWidget(
            labelText: 'Usuário',
            fontColor: Colors.black,
            backgroundColor: Colors.transparent,
            onChanged: (v) => controller.email = v,
            validator: (value) => value.isEmpty ? 'Usuario Inválido' : null,
          ),
          PasswordFieldWidget(
            fontColor: Colors.black,
            onChanged: (v) => controller.password = v,
            validator: (value) => value.isEmpty ? 'Senha Inválido' : null,
            label: 'Senha',
          ),
          Observer(
            builder: (_) => controller.loading
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircularButtonWidget(
                        backgroundColor: Colors.red,
                        label: "Entrar",
                        onTap: () async {
                          try {
                            controller.changeLoading(loading: true);
                            var user = await controller.loginWithEmail();
                            if (user != null) {
                              Modular.to
                                  .popAndPushNamed('/home', arguments: user);
                            }
                          } finally {
                            controller.changeLoading(loading: false);
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            color: Colors.blue,
                            icon: Icon(FontAwesomeIcons.google),
                            onPressed: () async {
                              try {
                                controller.changeLoading(loading: true);
                                var user = await controller.loginWithGoogle();
                                if (user != null) {
                                  Modular.to.popAndPushNamed('/home',
                                      arguments: user);
                                }
                              } finally {
                                controller.changeLoading(loading: false);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
