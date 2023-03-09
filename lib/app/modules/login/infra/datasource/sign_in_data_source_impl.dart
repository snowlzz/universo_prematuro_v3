import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_clean/app/modules/login/infra/datasource/sign_in_data_source.dart';

class SignInDataSourceImpl implements SignInDataSource{
  final FirebaseAuth firebaseAuth;

  SignInDataSourceImpl({required this.firebaseAuth});

  @override
  Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    final user = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user;
  }

}