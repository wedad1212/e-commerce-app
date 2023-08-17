
import 'package:ecommerce/view/widgets/home/bottom_navigation_bar_style.dart';
import 'package:ecommerce/view/widgets/home/cartWidget/bottom_screen_cart.dart';

import 'package:flutter/material.dart';


import '../../widgets/home/cartWidget/list_Product_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarStyle(),
      body:const Column(
        children: [
          ListProductCart(),
        BottomScreenCart()
        ],
      ),
    );
  }


}
