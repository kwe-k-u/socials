class Product{
  late String name;
  late int quantity;
  late double price;

  Product({
    required this.name,
    required this.price,
    required this.quantity
  });


  factory Product.fromMap(Map<String, dynamic> data){
    return Product(
      name: data["name"],
      price: data["price"],
      quantity: data["quantity"],
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