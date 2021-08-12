


import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:socials/utils/models/platform_keys.dart';
import 'package:socials/utils/models/product.dart';

 FirebaseDatabase database = FirebaseDatabase.instance;



Future<void> updatePlatforms({required String id, required PlatformKeys keys}) async{
await  database.reference().child("$id/keys").set(keys.keys);
}



Future<DataSnapshot?> getKeys(String id) async{
  return await database.reference().child("$id/keys").get();



}


Future<List<Product>> getProducts(String id) async{
  List<Product> products = [];
  await database.reference().child("$id/products").get().then((value) {
    if (value != null){
      print(value.value.keys.first.runtimeType);
      for (String _key in value.value.keys){
        Product prod =  Product.fromMap(Map<String,dynamic>.from(value.value[_key]));
        prod.id = _key;
        products.add(prod);
      }
    }
  });

  return products;
}


Future<void> uploadProduct({required String id, required Product product})async{
  DatabaseReference ref;
  if (product.id == null)
    ref = database.reference().child("$id/products").push();
  ref = database.reference().child("$id/products/${product.id}");

  await  ref.set(product.asMap());
}