import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_clean/app/modules/authentication/presenter/pages/sign_up_store.dart';
import 'package:up_clean/app/modules/authentication/domain/repositories/auth_repository.dart';
import 'package:up_clean/app/modules/authentication/domain/usecases/get_auth.dart';
import 'package:up_clean/app/modules/authentication/presenter/pages/authentication_page.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_clean/app/modules/authentication/presenter/pages/authentication_store.dart';
import 'package:up_clean/app/modules/home/presenter/pages/home_page.dart';


import '../home/presenter/pages/home_store.dart';
import 'infra/datasource/auth_data_source.dart';
import 'infra/datasource/auth_data_source_impl.dart';
import 'infra/repositories/auth_repository_impl.dart';

class AuthenticationModule extends Module {
  @override
  final List<Bind> binds = [

     // EXTERNAL
    Bind.instance<FirebaseAuth>(FirebaseAuth.instance),

    // REPOSITORY
    Bind.lazySingleton<AuthDataSource>((i) => AuthDataSourceImpl(firebaseAuth: i.get<FirebaseAuth>())),

    // USE CASES
    Bind.lazySingleton<GetAuthentication>((i) => GetAuthentication(repository: i.get<AuthRepository>())),

    // REPOSITORY IMPLEMENTATION
    Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dataSource: i.get<AuthDataSource>())),
    
    // STORES
    Bind.lazySingleton<AuthenticationStore>((i) => AuthenticationStore(usecase: i.get<GetAuthentication>())),
    Bind.lazySingleton<SignUpStore>((i) => SignUpStore(authenticationStore: i.get<AuthenticationStore>())),

    Bind.lazySingleton((i) => HomeStore())
  ];



  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
    ChildRoute('/home', child: (_, args) => HomePage())
  ];
}
