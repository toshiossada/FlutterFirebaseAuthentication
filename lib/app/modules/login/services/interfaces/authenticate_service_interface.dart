import 'package:firebase_auth/firebase_auth.dart';

import '../../models/authentication_model.dart';

abstract class IAuthenticateService {
  ///Faz autenticação com o usuario do Google
  Future<FirebaseUser> loginWithGoogle();

  ///Faz Login com Email e Senha utilizando o Firebase CloudStore
  Future<FirebaseUser> loginWithEmail(AuthenticationModel auth);
  //Recupera usuario logado
  Future<FirebaseUser> getUser();
}
