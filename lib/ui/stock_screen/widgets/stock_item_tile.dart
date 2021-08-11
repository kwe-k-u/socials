import 'package:flutter/material.dart';


class StockItemTile extends StatelessWidget {
  final String name;
  final int quantity;
  final double price;
  const StockItemTile({
    Key? key,
    required this.name,
    required this.quantity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListTile(
        leading: Icon(Icons.shop),
        title: Text(this.name),
        subtitle: Text("GHC ${price.toStringAsFixed(2)}"),
        trailing: Text(quantity.toString()),
      );
  }
}
