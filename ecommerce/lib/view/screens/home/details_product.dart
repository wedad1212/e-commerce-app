import 'package:ecommerce/controller/home/cart_controller.dart';
import 'package:ecommerce/core/class/statues_request.dart';
import 'package:ecommerce/core/constant/colors.dart';
import 'package:ecommerce/core/model/cart_model.dart';
import 'package:ecommerce/core/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/botton_style.dart';
import '../../widgets/home/custom_text_style.dart';
import '../../widgets/home/detailsProductWidget/botton_top_text.dart';

class DetailsProduct extends GetView{
  const DetailsProduct({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.33,
              child: Image.network(
                productModel.image,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25),
              child: CustomTextStyle(
                  text: productModel.name,
                  textAlign: TextAlign.start,
                  fontSize: 20,
                  color: textColor,
                  alignmentGeometry: Alignment.topLeft)),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottonTopText(text1: "Size", widget: Text(productModel.size)),
                const SizedBox(
                  width: 25,
                ),
                BottonTopText(
                    text1: "Color",
                    widget: Container(
                      decoration: BoxDecoration(
                          color: productModel.color,
                          borderRadius: BorderRadius.circular(15)),
                      width: 30,
                      height: 25,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25),
              child: CustomTextStyle(
                  text: "Details",
                  textAlign: TextAlign.start,
                  fontSize: 20,
                  color: textColor,
                  alignmentGeometry: Alignment.topLeft)),
          const SizedBox(
            height: 5,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                productModel.description,
                style: const TextStyle(fontSize: 17, height: 2.5),
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "Price",
                        style: TextStyle(fontSize: 20, color: textColor,fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "\$${productModel.price}",
                        style: const TextStyle(color: Colors.red, fontSize: 25),
                      )),
                ],
              ),
              GetBuilder<CartControllerImp>(
                init:CartControllerImp(),
                  builder: (controller) => BottonStyleAuth(
                      textbotton: "Add",
                      onPressed: () {
                        controller.addProductToCart(
                          CartModel(
                            productModel.name,
                            productModel.image,
                            productModel.price,
                            1,
                            productModel.productId
      
                          
              ));
                      },
                      width: 160))
            ],
          ),
        ]),
      ),
    );
  }
}
