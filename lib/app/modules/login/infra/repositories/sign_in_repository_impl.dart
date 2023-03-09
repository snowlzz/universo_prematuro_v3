import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_clean/app/modules/login/domain/repositories/sign_in_repository.dart';
import 'package:up_clean/app/modules/login/infra/datasource/sign_in_data_source.dart';

class SignInRepositoryImpl implements SignInRepository{
  final SignInDataSource dataSource;

  SignInRepositoryImpl({required this.dataSource});

  
  @override
  Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
   return await dataSource.signInWithEmailAndPassword(email: email, password: password);
  }

  
}