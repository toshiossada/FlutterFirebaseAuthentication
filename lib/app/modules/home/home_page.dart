import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  final FirebaseUser user;
  const HomePage({Key key, this.title = "Home", this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            onPressed: () {
              Modular.to.popAndPushNamed('/');
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text('${widget.user.email} ${widget.user.displayName ?? ''}'),
          ],
        ),
      ),
    );
  }
}
