
import 'package:ecommerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class BottonTopText extends StatelessWidget {
  const BottonTopText({super.key, required this.text1, required this.widget});
  final String text1;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: MediaQuery.of(context).size.width*0.40,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.grey)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            text1,
            style: const TextStyle(color:textColor, fontSize: 17),
          ),
          widget
        ]),
      ),
    );
  }
}
