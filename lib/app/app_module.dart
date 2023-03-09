
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_clean/app/modules/authentication/domain/repositories/auth_repository.dart';
import 'package:up_clean/app/modules/authentication/domain/usecases/get_auth.dart';
import 'package:up_clean/app/modules/authentication/infra/datasource/auth_data_source.dart';
import 'package:up_clean/app/modules/authentication/infra/datasource/auth_data_source_impl.dart';
import 'package:up_clean/app/modules/authentication/infra/repositories/auth_repository_impl.dart';
import 'package:up_clean/app/modules/authentication/presenter/pages/authentication_page.dart';
import 'package:up_clean/app/modules/authentication/presenter/pages/sign_up_store.dart';


import 'modules/authentication/authentication_module.dart';
import 'modules/authentication/presenter/pages/authentication_store.dart';
import 'modules/home/home_module.dart';
import 'modules/login/domain/repositories/sign_in_repository.dart';
import 'modules/login/domain/usecases/sign_in.dart';
import 'modules/login/infra/datasource/sign_in_data_source.dart';
import 'modules/login/infra/datasource/sign_in_data_source_impl.dart';
import 'modules/login/infra/repositories/sign_in_repository_impl.dart';
import 'modules/login/login_module.dart';
import 'modules/login/presenter/pages/login_store.dart';


// import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // EXTERNAL
    Bind.instance<FirebaseAuth>(FirebaseAuth.instance),

    // REPOSITORY
    Bind.lazySingleton<AuthDataSource>((i) => AuthDataSourceImpl(firebaseAuth: i.get<FirebaseAuth>())),

    Bind.lazySingleton<SignInDataSource>((i) => SignInDataSourceImpl(firebaseAuth: i.get<FirebaseAuth>())),

    // USE CASES
    Bind.lazySingleton<GetAuthentication>((i) => GetAuthentication(repository: i.get<AuthRepository>())),

    Bind.lazySingleton<GetSignIn>((i) => GetSignIn(repository: i.get<SignInRepository>())),

    // REPOSITORY IMPLEMENTATION
    Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dataSource: i.get<AuthDataSource>())),

    Bind.lazySingleton<SignInRepository>((i) => SignInRepositoryImpl(dataSource: i.get<SignInDataSource>())),
    
    // STORES
    Bind.lazySingleton<AuthenticationStore>((i) => AuthenticationStore(usecase: i.get<GetAuthentication>())),

    Bind.lazySingleton<SignUpStore>((i) => SignUpStore(authenticationStore: i.get<AuthenticationStore>())),
    
    Bind.lazySingleton<LoginStore>((i) => LoginStore(usecase: i.get<GetSignIn>()))

  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: LoginModule()),
    ModuleRoute('/auth', module: AuthenticationModule()),
    ModuleRoute('/home', module: HomeModule()),
    
  ];
}
