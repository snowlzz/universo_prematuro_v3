import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> getUser();

  Future<User> createUserWithEmailAndPasswrod({
    required String email,
    required String password,
  });
  
  Future<void> signOut();
}
