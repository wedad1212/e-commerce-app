import 'package:ecommerce/core/class/statues_request.dart';

import 'package:ecommerce/core/model/product_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../core/services/get_products.dart';

abstract class ProductController extends GetxController {
  getProduct();
}

class ProductControllerImp extends ProductController {
  List<ProductModel> listProducts = [];
  StatuesRequest? statuesRequest;
  late ProductModel productModel;
  GetProductsService? getProductService;
  ProductControllerImp() {
    getProduct();
  }

  @override
  getProduct() async {
    statuesRequest = StatuesRequest.loading;
    getProductService = GetProductsService();
    update();
    productModel = ProductModel("", "", "",Colors.white, "", "","");
    await getProductService!.getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        listProducts.add(
            productModel.formJson(value[i].data() as Map<dynamic, dynamic>));
      }
      statuesRequest = StatuesRequest.success;
      update();
    });
  }
}
