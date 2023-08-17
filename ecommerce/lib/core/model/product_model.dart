// ignore_for_file: unnecessary_null_comparison

import 'package:ecommerce/core/class/hexcolor.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String name, image, description, size, price,productId;
  Color color;

  ProductModel(this.name, this.image, this.description, this.color, this.size,
      this.price,this.productId);

  ProductModel formJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return ProductModel("", "", "", Colors.white, "", "","");
    }
    return ProductModel(
        name = map['name'],
        image = map['image'],
        description = map['description'],
        color = HexColor.fromHex(map['color']),
        size = map['size'],
        price = map['price'],
        productId=map['productId']
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      ' image': image,
      'description': description,
      ' color ': color,
      'size': size,
      'price': price,
      'productId':productId,
    };
  }
}
