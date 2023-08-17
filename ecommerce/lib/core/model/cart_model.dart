


// ignore_for_file: unnecessary_null_comparison

class CartModel {
  String name, image, price,productId;
  int quantity;

  CartModel(this.name, this.image,
      this.price,this.quantity,this.productId);
  CartModel formJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return CartModel("", "","" , 1,"");
    }
    return CartModel(
        name = map['name'],
        image = map['image'],
        price = map['price'],
          quantity=map['quantity'],
          productId=map['productId'],
     ) ;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      ' image': image,
      'price': price,
       'quantity':quantity,
       'productId':productId,
    };
  }
}
