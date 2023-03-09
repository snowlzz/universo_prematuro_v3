import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:up_clean/app/modules/login/domain/repositories/sign_in_repository.dart';
import 'package:up_clean/app/modules/login/domain/usecases/sign_in.dart';

import '../../../authentication/domain/entities/user_model.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final GetSignIn usecase;

  _LoginStoreBase({required this.usecase});

  UserModel user = UserModel();

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerPass = TextEditingController();

  @action
  Future<void> signInWithEmailAndPassword() async {
    user.email = controllerEmail.text;
    user.pass = controllerPass.text;

    try {
      await usecase
          .signInWithEmailAndPassword(email: user.email ?? "", password: user.pass ?? "")
          .then((value) => Modular.to.pushReplacementNamed('/home'));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
