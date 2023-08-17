import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../controller/home/cart_controller.dart';
import '../../../../core/constant/colors.dart';
import '../../auth/botton_style.dart';

class BottomScreenCart extends StatelessWidget {
  const BottomScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Price",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "  \$ ${controller.totalPrice.toString()}",
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                BottonStyleAuth(
                  onPressed: () {},
                  textbotton: "Continue",
                  width: 160,
                )
              ],
            ));
  }
}
