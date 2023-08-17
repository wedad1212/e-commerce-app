// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:ecommerce/controller/home/category_controller.dart';
import 'package:ecommerce/controller/home/product_controller.dart';
import 'package:ecommerce/core/class/statues_request.dart';
import 'package:ecommerce/core/constant/colors.dart';
import 'package:ecommerce/core/constant/const_image_route.dart';

import 'package:ecommerce/view/screens/home/details_product.dart';
import 'package:ecommerce/view/widgets/home/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/home/bottom_navigation_bar_style.dart';

class HomeScreen extends GetView {
  HomeScreen({super.key});

  List listBestSelling = [
    ConstImage.watch,
    ConstImage.chair,
    ConstImage.watch,
    ConstImage.chair
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBarStyle(),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100),
                child: TextFormField(
                  cursorColor: textColor,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: textColor,
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextStyle(
                text: "Categories",
                textAlign: TextAlign.start,
                fontSize: 18,
                color: textColor,
                alignmentGeometry: Alignment.topLeft,
              ),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<CategoryControllerImp>(
                builder: (controller) => controller.statuesRequest ==
                        StatuesRequest.loading
                    ? const Center(
                        child: CircularProgressIndicator(color: textColor),
                      )
                    : Container(
                        padding: const EdgeInsets.all(2),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listCategories.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Expanded(
                                    child: Image.network(controller
                                        .listCategories[index].image)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    child: Text(
                                  controller.listCategories[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 15),
                                ))
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                        ),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextStyle(
                      text: "Best Selling",
                      textAlign: TextAlign.start,
                      fontSize: 18,
                      color: textColor,
                      alignmentGeometry: Alignment.topLeft),
                  CustomTextStyle(
                      text: "See All",
                      textAlign: TextAlign.end,
                      fontSize: 18,
                      color: textColor,
                      alignmentGeometry: Alignment.topRight),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
               
                height: 300,
                child: GetBuilder<ProductControllerImp>(
                  builder: (controller) => controller.statuesRequest ==
                          StatuesRequest.loading
                      ? const Center(
                          child: CircularProgressIndicator(color: textColor),
                        )
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listProducts.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(DetailsProduct(
                                    productModel:
                                        controller.listProducts[index]));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .4,
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: SizedBox(
                                      height: 40,
                                      width: 160,
                                      child: Image.network(
                                        controller.listProducts[index].image,
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomTextStyle(
                                        text:
                                            controller.listProducts[index].name,
                                        textAlign: TextAlign.start,
                                        fontSize: 17,
                                        color: textColor,
                                        alignmentGeometry: Alignment.topLeft),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomTextStyle(
                                        maxLine: 1,
                                        text: controller
                                            .listProducts[index].description,
                                        textAlign: TextAlign.start,
                                        fontSize: 15,
                                        color: Colors.grey,
                                        alignmentGeometry: Alignment.topLeft),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomTextStyle(
                                        text:"\$ " + controller
                                                .listProducts[index].price 
                                            ,
                                        textAlign: TextAlign.start,
                                        fontSize: 20,
                                        color: Colors.red,
                                        alignmentGeometry: Alignment.topLeft),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                              width: 15,
                            );
                          },
                        ),
                ),
              )
            ])),
      ),
    );
  }
}
