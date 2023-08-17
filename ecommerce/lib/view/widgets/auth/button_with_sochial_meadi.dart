import 'package:flutter/material.dart';

class ButtonWithSochialMedia extends StatelessWidget {
  const ButtonWithSochialMedia(
      {super.key, required this.image, this.onTap, this.scale});
  final String image;
  final void Function()? onTap;
  final double? scale;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

        child: Image.asset(
          image,
          scale: scale,
        ),

    );
  }
}
