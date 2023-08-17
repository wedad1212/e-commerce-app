import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class BottonStyleAuth extends StatelessWidget {
  const BottonStyleAuth(
      {super.key, required this.textbotton, required this.onPressed, required this.width});
  final String textbotton;
  final void Function() onPressed;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: width,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [textColor, primaryColor])),
        child: MaterialButton(
            onPressed: onPressed,
            child: Text(
              textbotton,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )));
  }
}
