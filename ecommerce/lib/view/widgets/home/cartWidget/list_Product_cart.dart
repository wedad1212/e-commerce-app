import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../controller/home/cart_controller.dart';
import '../../../../core/class/statues_request.dart';
import '../../../../core/constant/colors.dart';
import '../custom_text_style.dart';

class ListProductCart extends StatelessWidget {
  const ListProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      builder: (controller) => controller.statuesRequest ==
              StatuesRequest.loading
          ? const CircularProgressIndicator(
              color: textColor,
            )
          : Expanded(
              child: ListView.separated(
                itemCount: controller.list.length,
                itemBuilder: (context, index) => Row(children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      controller.list[index].image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextStyle(
                          text: controller.list[index].name,
                          textAlign: TextAlign.start,
                          fontSize: 20,
                          color: textColor,
                          alignmentGeometry: Alignment.topLeft),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("\$ ${controller.list[index].price}",
                          style: const TextStyle(color: Colors.red, fontSize: 20)),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.shade200,
                          ),
                          width: 140,
                          height: 35,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
onTap: ()=>controller.increaceProduct(index),
                                child: const Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: textColor,
                                     ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 9),
                                  child: Text(
                                    controller.list[index].quantity.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: GestureDetector(
                                    onTap: ()=>controller.decreaceProduct(index),
                                    child: const Text(
                                      "-",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: textColor,
                                         ),
                                    ),
                                  ))
                            ],
                          ))
                    ],
                  )
                ]),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 40,
                  );
                },
              ),
            ),
    );
  }
}