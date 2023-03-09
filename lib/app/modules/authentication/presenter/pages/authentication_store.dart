import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import '../../../core/authentication_enum/auth_status.dart';
import '../../domain/usecases/get_auth.dart';

part 'authentication_store.g.dart';

class AuthenticationStore = _AuthenticationStoreBase with _$AuthenticationStore;
abstract class _AuthenticationStoreBase with Store {

  final GetAuthentication usecase;

  _AuthenticationStoreBase({required this.usecase}) {
    usecase.getUser().then((setUser));
  }

  @observable
  AuthStatus authenticationStatus = AuthStatus.loading;

  @observable
  User? user;

  @action
  setUser(User? value) {
    user = value;
    authenticationStatus = user == null
        ? AuthStatus.logoff
        : AuthStatus.logged;
  }

  
  Future<User> createUserWithEmailAndPassword({required String email, required String password}) async {
    user = await usecase.createUserWithEmailAndPasswrod(email: email, password: password);
    return user!;
  }
}