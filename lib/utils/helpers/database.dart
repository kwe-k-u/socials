


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
  database.reference().child("$id/products").get().then((value) {
    if (value != null){
      for (Map<String, dynamic> data in value.value) {
        products.add(Product.fromMap(data));

      }
    }
  });

  return products;
}


Future<void> uploadProduct({required String id, required Product product})async{
  await  database.reference().child("$id/products").update(product.asMap());
}