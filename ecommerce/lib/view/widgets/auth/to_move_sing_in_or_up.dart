import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class TextSingInOrUp extends StatelessWidget {
  const TextSingInOrUp({super.key, required this.text1, required this.tetxt2,required this.onTap});
  final String text1;
  final String tetxt2;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            tetxt2,
            style: const TextStyle(
                color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
