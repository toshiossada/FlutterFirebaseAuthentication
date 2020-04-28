import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../models/authentication_model.dart';
import '../repositories/interfaces/authenticate_repository_interface.dart';
import 'interfaces/authenticate_service_interface.dart';

class AuthenticateService extends Disposable implements IAuthenticateService {
  final IAuthenticateRepository _authenticateRepository;

  AuthenticateService(this._authenticateRepository);

  @override
  void dispose() {}
//Recupera usuario logado
  @override
  Future<FirebaseUser> getUser() {
    return _authenticateRepository.getUser();
  }

  ///Faz Login com Email e Senha utilizando o Firebase CloudStore
  @override
  Future<FirebaseUser> loginWithEmail(AuthenticationModel auth) {
    return _authenticateRepository.loginWithEmail(auth);
  }

  ///Faz autenticação com o usuario do Google
  @override
  Future<FirebaseUser> loginWithGoogle() {
    return _authenticateRepository.loginWithGoogle();
  }
}
