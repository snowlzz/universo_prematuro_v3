// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables, must_be_immutable, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


import '../pages/authentication_store.dart';





class EmailInputField extends StatelessWidget {
  final TextEditingController inputController;
  // ignore: prefer_typing_uninitialized_variables
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Color primaryColor = const Color.fromARGB(255, 255, 193, 143);
  final Color secondaryColor = const Color.fromARGB(255, 101, 187, 77);
  final InputDecoration? decoration;


  const EmailInputField(
      {Key? key,
      required this.inputController,
      this.onChanged,
      this.validator,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextFormField(
        controller: inputController,
        onChanged: onChanged,
        validator: validator,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.green,
          ),
          iconColor: Colors.white,
          filled: true,
          fillColor: Colors.white,
          hintText: 'Insira seu email',
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(.75),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}

class EmailInputFb2 extends StatelessWidget {
  final TextEditingController inputController;
  String? errorText;
  EmailInputFb2({Key? key, required this.inputController, this.errorText})
      : super(key: key);
  AuthenticationStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    const accentColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.white.withOpacity(.9)),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ]),
          child: TextField(
            controller: inputController,
            onChanged: (value) {
              if (!value.contains("@")) {
                "urro";
              } else {
                null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
              label: const Text("Email"),
              labelStyle: const TextStyle(color: primaryColor),
              errorText: errorText,
              // prefixIcon: Icon(Icons.email),
              filled: true,
              fillColor: accentColor,
              hintText: 'support@flutterbricks.com',
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NameInputFieldFb3 extends StatelessWidget {
  final TextEditingController inputController;
  final onChanged;
  final decoration;
  final validator;
  final hintText;

  // final errorText;
  const NameInputFieldFb3({
    Key? key,
    required this.inputController,
    this.onChanged,
    this.validator,
    this.decoration,
    this.hintText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextFormField(
        controller: inputController,
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.green,
          ),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 211, 0, 0), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  final String? hintText;
  final TextEditingController inputController;
  final onChanged;
  final decoration;

  const PasswordInput(
      {required this.inputController,
      this.hintText,
      Key? key,
      this.onChanged,
      this.decoration})
      : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  final Color secondaryColor = const Color.fromARGB(255, 101, 187, 77);
  bool pwdVisibility = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.inputController,
      obscureText: !pwdVisibility,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: const Icon(
          Icons.key_rounded,
          color: Colors.green,
        ),
        hintText: 'Insira sua senha',
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(.75),
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: InkWell(
          onTap: () => setState(
            () => pwdVisibility = !pwdVisibility,
          ),
          child: Icon(
            pwdVisibility
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey.shade400,
            size: 18,
          ),
        ),
      ),
    );
  }
}



  // # CORES UP

// ## LARANJA MEIO ESCURO
//   ## R: 239, G: 121, B: 91

// ## lARANJA ESCURO
//   ## R: 192, G: 60, B: 39

// ## VERDE CLARO
//   ## R: 101, G: 187, B: 88

// ## VERDE FLUORESCENTE
//   ## R: 34, G: 206, B: 0

// ## VERDE ESCURO
//   ## R: 35, G 85, B, 24