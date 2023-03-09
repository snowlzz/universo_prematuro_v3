import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_clean/app/modules/authentication/domain/repositories/auth_repository.dart';

class GetAuthentication implements AuthRepository {
  final AuthRepository repository;

  GetAuthentication({required this.repository});


  @override
  Future<User?> getUser(){
    return repository.getUser();
  }
  
  @override
  Future<User> createUserWithEmailAndPasswrod({required String email, required String password}) {
    return repository.createUserWithEmailAndPasswrod(email: email, password: password);
  }
  
  @override
  Future<void> signOut() {
    return repository.signOut();
  }
}