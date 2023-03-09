import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<User> createUserWithEmailAndPasswrod({required String email, required String password}) async {
    return await dataSource.createUserWithEmailAndPasswrod(email: email, password: password);
  }

  @override
  Future<User?> getUser() {
    return dataSource.getUser();
  }

  @override
  Future<void> signOut() async {
    await dataSource.signOut();
  }

}