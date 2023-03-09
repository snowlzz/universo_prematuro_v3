import 'package:firebase_auth/firebase_auth.dart';


import 'auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth firebaseAuth;
  AuthDataSourceImpl({required this.firebaseAuth});

  @override
  Future<User> createUserWithEmailAndPasswrod({required String email, required String password}) async {
    final user = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user!;
  }

  @override
  Future<User?> getUser() async {
   return firebaseAuth.currentUser;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
