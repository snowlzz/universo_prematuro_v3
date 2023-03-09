import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_clean/app/modules/authentication/infra/datasource/auth_data_source_impl.dart';
import 'package:up_clean/app/modules/login/domain/usecases/sign_in.dart';
import 'package:up_clean/app/modules/login/infra/datasource/sign_in_data_source.dart';
import 'package:up_clean/app/modules/login/infra/repositories/sign_in_repository_impl.dart';
import 'package:up_clean/app/modules/login/presenter/pages/login_page.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_clean/app/modules/login/presenter/pages/login_store.dart';

import 'domain/repositories/sign_in_repository.dart';
import 'infra/datasource/sign_in_data_source_impl.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
  //EXTERNAL
    Bind.instance<FirebaseAuth>(FirebaseAuth.instance),

   // repo 
    Bind.lazySingleton<SignInDataSource>((i) => SignInDataSourceImpl(firebaseAuth: i.get<FirebaseAuth>())),
    
    //usecases
    Bind.lazySingleton<GetSignIn>((i) => GetSignIn(repository: i.get<SignInRepository>())),


    // repo impl
    Bind.lazySingleton<SignInRepository>((i) => SignInRepositoryImpl(dataSource: i.get<SignInDataSource>())),

    // sotre
    Bind.lazySingleton<LoginStore>((i) => LoginStore(usecase: i.get<GetSignIn>()))
    // Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
