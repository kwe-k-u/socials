



import 'package:firebase_database/firebase_database.dart';
import 'package:socials/utils/models/platform_keys.dart';
import 'package:socials/utils/models/product.dart';




Future<void> updatePlatforms({required String id, required PlatformKeys keys}) async{
  FirebaseDatabase database = FirebaseDatabase.instance;
await  database.reference().child("$id/keys").set(keys.keys);
}



Future<DataSnapshot?> getKeys(String id) async{
  FirebaseDatabase database = FirebaseDatabase.instance;
  return await database.reference().child("$id/keys").get();



}


Future<List<Product>> getProducts(String id) async{
  FirebaseDatabase database = FirebaseDatabase.instance;
  List<Product> products = [];
  await database.reference().child("$id/products").get().then((value) {
      for (String _key in value.value.keys){
        Product prod =  Product.fromMap(Map<String,dynamic>.from(value.value[_key]));
        prod.id = _key;
        products.add(prod);
      }
  });

  return products;
}


Future<void> uploadProduct({required String id, required Product product})async{
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref;
  if (product.id == null)
    ref = database.reference().child("$id/products").push();
  ref = database.reference().child("$id/products/${product.id}");

  await  ref.set(product.asMap());
}