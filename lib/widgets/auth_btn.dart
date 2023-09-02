import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
       this.backColor=Colors.white38});
  final void Function()? onPressed;
  final String buttonText;
  final Color backColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: backColor),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
  }
}
