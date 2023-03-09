import 'package:up_clean/app/modules/home/presenter/pages/home_page.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:up_clean/app/modules/home/presenter/pages/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
