import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:up_clean/app/modules/authentication/presenter/pages/authentication_store.dart';

import '../../infra/models/user_model.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;
abstract class _SignUpStoreBase with Store {

  final AuthenticationStore authenticationStore;

  _SignUpStoreBase({required this.authenticationStore});

  UserModel user = UserModel();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerPass = TextEditingController();

  @observable
  TextEditingController controllerName = TextEditingController();

  @observable
  bool isVisible = true;

  @action
  setVisibility(bool value) => isVisible = value;

  @observable
  bool isCheck = false;

  @action
  setCheckTerms(bool value) => isCheck = value;

  @observable
  bool loading = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  setEmail(String value) => email = value;

  @action
  setPassword(String value) => password = value;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @observable
  String? errorMessage;

  @action
  setErrorMessage(String? value) => errorMessage = value;

  String? validateEmail(String? value) {
    if (!(value!.contains('@'))) {
      autovalidateMode = AutovalidateMode.always;
      return 'Email invalid';
    } else if (value.isEmpty) {
      autovalidateMode = AutovalidateMode.always;
      return 'Cannot be empty';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.length < 8) {
      autovalidateMode = AutovalidateMode.always;
      return 'Email invalid';
    } else if (value.isEmpty) {
      autovalidateMode = AutovalidateMode.always;
      return 'Cannot be empty';
    } else {
      return null;
    }
  }

  @action
  Future createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    loading = true;
    Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
      try {
        await authenticationStore
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((user) async {
          if (user != null) loading = false;
          Modular.to.popUntil((route) => route.isFirst);
          Modular.to.pushReplacementNamed('/home', arguments: user);
          saveDataToFirebase();
        });
      } on FirebaseAuthException catch (error) {
        loading = false;
        errorMessage = error.message;
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests. Try again later.";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = error.message;
        }
      }
    });
  }

   @action
  Future<void> saveDataToFirebase() async {
    user.uid = _auth.currentUser!.uid;
    user.name = controllerName.text;
    user.email = controllerEmail.text;
    user.pass = controllerPass.text;
    user.registration = DateTime.now().toString();

    Map<String, dynamic> data = {
      'uid': user.uid,
      'nome mae': user.name,
      'email': user.email,
      'senha': user.pass.hashCode,
      'data reg.': user.registration,
      // 'cep': eStore.controllerCEP.text
    };
    _db.collection('users').doc(user.uid).set(data);
  }
}