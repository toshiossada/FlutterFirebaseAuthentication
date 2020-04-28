import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste3/app/modules/login/login_module.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  final FirebaseAuth _firebase = FirebaseAuth.instance;
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule(_firebase)),
        Router(
          '/home',
          module: HomeModule(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
