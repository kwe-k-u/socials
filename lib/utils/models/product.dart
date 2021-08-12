import 'package:firebase_database/firebase_database.dart';

class Product{
  late String name;
  late int quantity;
  late double price;
  String? id;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    this.id
  });


  factory Product.fromMap(Map<String, dynamic> data){
    return Product(
      name: data["name"],
      price: data["price"].toDouble(),
      quantity: data["quantity"].toInt(),
    );
  }


  Map<String, dynamic> asMap(){
    return {
      "name" : name,
      "price" : price,
      "quantity" : quantity
    };
  }

}