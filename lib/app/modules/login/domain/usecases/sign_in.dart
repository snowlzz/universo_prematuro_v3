import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_clean/app/modules/login/domain/repositories/sign_in_repository.dart';

class GetSignIn implements SignInRepository{
  final SignInRepository repository;

  GetSignIn({required this.repository});


  @override
  Future<User?> signInWithEmailAndPassword({required String email, required String password}) {
    return repository.signInWithEmailAndPassword(email: email, password: password);
  }


}