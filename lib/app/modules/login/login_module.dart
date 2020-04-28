import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/password_field/password_field_controller.dart';
import 'login_controller.dart';
import 'login_page.dart';
import 'repositories/authenticate_repository.dart';
import 'repositories/interfaces/authenticate_repository_interface.dart';
import 'services/authenticate_service.dart';
import 'services/interfaces/authenticate_service_interface.dart';

class LoginModule extends ChildModule {
  final FirebaseAuth _firebase;
  LoginModule(this._firebase);

  @override
  List<Bind> get binds => [
        Bind((i) => PasswordFieldController()),
        Bind<IAuthenticateRepository>((i) => AuthenticateRepository(_firebase)),
        Bind<IAuthenticateService>(
            (i) => AuthenticateService(i.get<IAuthenticateRepository>())),
        Bind((i) => LoginController(i.get<IAuthenticateService>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
