import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import 'models/authentication_model.dart';
import 'services/interfaces/authenticate_service_interface.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final IAuthenticateService _authenticateService;
  @observable
  bool loading = false;

  AuthenticationModel auth = AuthenticationModel('', '');

  _LoginControllerBase(this._authenticateService);

  @action
  void changeLoading({bool loading}) {
    loading = loading;
  }

  set email(String v) => auth.email = v;
  String get email => auth.email;
  set password(String v) => auth.password = v;
  String get password => auth.password;

  Future<FirebaseUser> loginWithGoogle() async {
    return await _authenticateService.loginWithGoogle();
  }

  Future<FirebaseUser> loginWithEmail() async {
    return await _authenticateService.loginWithEmail(auth);
  }
}
