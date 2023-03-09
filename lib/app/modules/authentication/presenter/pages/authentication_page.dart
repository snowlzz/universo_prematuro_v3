import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter/material.dart';
import 'package:up_clean/app/modules/authentication/presenter/pages/sign_up_store.dart';

import '../utils/inputs.dart';
import 'authentication_store.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final store = Modular.get<SignUpStore>();
  // UserModel user = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastre-se',
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 193, 143),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Modular.to.pushReplacementNamed('/');
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 193, 143),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(child: LayoutBuilder(builder: (_, constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                        child: Image.asset(
                      'images/logo/LogoMov.gif',
                      width: 300,
                    )),
                    Container(
                      width: MediaQuery.of(context).size.width * .90,
                      height: MediaQuery.of(context).size.height * .4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 8,
                              spreadRadius: 1.5,
                              color: Colors.black.withOpacity(.3))
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NameInputFieldFb3(
                                inputController: store.controllerName,
                                hintText: 'Insira seu nome',
                              ),
                              const SizedBox(height: 20),
                              EmailInputField(
                                  inputController: store.controllerEmail,
                                  ),
                              const SizedBox(height: 20),
                              PasswordInput(
                                  inputController: store.controllerPass,
                                  ),
                              Observer(builder: (_) {
                                return Text(store.errorMessage ?? ""
                                );
                              }),
                            ],
                          )),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          store.createUserWithEmailAndPassword(
                              email: store.controllerEmail.text,
                              password: store.controllerPass.text);
                        },
                        child: const Text('Cadastrar')),
                  ],
                ),
              );
            })),
          ],
        ),
      ),
    );
  }
}
