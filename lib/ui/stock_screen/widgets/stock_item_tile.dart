import 'package:flutter/material.dart';
import 'package:socials/utils/helpers/database.dart';
import 'package:socials/utils/models/app_state.dart';
import 'package:socials/utils/models/product.dart';
import 'package:provider/provider.dart';


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

          String id = context.read<AppState>().user!.uid;
          print("id is $id");
            uploadProduct(
                id: id,
                product: Product(
                    name: "Smsung",
                    price: 400.44,
                    quantity: 5
                )
            );

        },
        leading: Icon(Icons.shop),
        title: Text(item.name),
        subtitle: Text("GHC ${item.price.toStringAsFixed(2)}"),
        trailing: Text(item.quantity.toString()),
      );
  }
}
