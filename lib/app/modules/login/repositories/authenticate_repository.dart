import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/authentication_model.dart';
import 'interfaces/authenticate_repository_interface.dart';

class AuthenticateRepository extends Disposable
    implements IAuthenticateRepository {
  final FirebaseAuth firebaseAuth;

  AuthenticateRepository(this.firebaseAuth);

  @override
  void dispose() {}

  //Recupera usuario logado
  @override
  Future<FirebaseUser> getUser() {
    return firebaseAuth.currentUser();
  }

  ///Faz Login com Email e Senha utilizando o Firebase CloudStore
  @override
  Future<FirebaseUser> loginWithEmail(AuthenticationModel auth) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: auth.email.trim(), password: auth.password);

    var user = await firebaseAuth.currentUser();
    return user;
  }

  ///Faz autenticação com o usuario do Google
  @override
  Future<FirebaseUser> loginWithGoogle() async {
    var _googleSignIn = GoogleSignIn();
    var googleUser = await _googleSignIn.signIn();
    var googleAuth = await googleUser.authentication;

    var credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    var user = (await firebaseAuth.signInWithCredential(credential)).user;
    return user;
  }
}
