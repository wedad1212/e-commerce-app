import 'package:ecommerce/core/class/statues_request.dart';
import 'package:ecommerce/core/model/cart_model.dart';
import 'package:ecommerce/data/dataSource/remote/sqflite_cart_database.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  addProductToCart(CartModel cartModel);
  getAllProductToCart(CartModel cartModel);
  getTotalPrice();
  increaceProduct(int index);
  decreaceProduct(int index);
}

class CartControllerImp extends CartController {
  StatuesRequest? statuesRequest;
  List<CartModel> list = [];
  CartModel cartModel = CartModel("", "", "", 1, "");
  double totalPrice = 0.0;
  final db = DatabaseCart.db;
  CartControllerImp() {
    getAllProductToCart(cartModel);
  }
  @override
  getAllProductToCart(CartModel cartModel) async {
    statuesRequest = StatuesRequest.loading;
    update();

    list = await db.getAllProductCart(cartModel);
    print(list.length);
    statuesRequest = StatuesRequest.success;
    getTotalPrice();
    update();
  }

  @override
  addProductToCart(cartModel) async {
    statuesRequest = StatuesRequest.loading;

    update();
    for (int i = 0; i < list.length; i++) {
      if (list[i].productId == cartModel.productId) {
        return;
      } 
        await db.insert(cartModel);
        list.add(cartModel);
        totalPrice += double.parse(cartModel.price * cartModel.quantity);
      
    }
    await db.insert(cartModel);
    list.add(cartModel);
    totalPrice += double.parse(cartModel.price * cartModel.quantity);
    statuesRequest = StatuesRequest.success;
    print("add");
    update();
  }

  @override
  getTotalPrice() {
    for (int i = 0; i < list.length; i++) {
      totalPrice += double.parse(list[i].price * list[i].quantity);
    }
    update();
    print(totalPrice);
  }

  @override
  decreaceProduct(int index) {
    list[index].quantity--;
    db.updateProduct(list[index]);
    totalPrice -= double.parse(list[index].price);
   
    update();
  }

  @override
  increaceProduct(int index) {
    list[index].quantity++;
      db.updateProduct(list[index]);
    totalPrice += double.parse(list[index].price);
  
    update();
  }
}
