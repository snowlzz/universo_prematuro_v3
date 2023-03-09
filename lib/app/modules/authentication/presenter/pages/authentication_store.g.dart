// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationStore on _AuthenticationStoreBase, Store {
  late final _$authenticationStatusAtom = Atom(
      name: '_AuthenticationStoreBase.authenticationStatus', context: context);

  @override
  AuthStatus get authenticationStatus {
    _$authenticationStatusAtom.reportRead();
    return super.authenticationStatus;
  }

  @override
  set authenticationStatus(AuthStatus value) {
    _$authenticationStatusAtom.reportWrite(value, super.authenticationStatus,
        () {
      super.authenticationStatus = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_AuthenticationStoreBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$_AuthenticationStoreBaseActionController =
      ActionController(name: '_AuthenticationStoreBase', context: context);

  @override
  dynamic setUser(User? value) {
    final _$actionInfo = _$_AuthenticationStoreBaseActionController.startAction(
        name: '_AuthenticationStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthenticationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authenticationStatus: ${authenticationStatus},
user: ${user}
    ''';
  }
}
