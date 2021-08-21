import 'package:flutter/material.dart';
import 'package:socials/utils/models/product.dart';


class StockItemTile extends StatelessWidget {
  final Product item;

  const StockItemTile({
    Key? key,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListTile(
        onTap: () async {


        },
        leading: Icon(Icons.shop),
        title: Text(item.name),
        subtitle: Text("GHC ${item.price.toStringAsFixed(2)}"),
        trailing: Text(item.quantity.toString()),
      );
  }
}
