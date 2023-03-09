import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInDataSource {
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}