import 'package:flutter/material.dart';

class OutlineButtonFb1 extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const OutlineButtonFb1(
      {required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.green;

    const double borderRadius = 20;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            side: MaterialStateProperty.all(
                const BorderSide(color: primaryColor, width: 1)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius))))),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: primaryColor),
        ),
      ),
    );
  }
}

