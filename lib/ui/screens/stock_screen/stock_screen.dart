import "package:flutter/material.dart";
import 'package:socials/ui/screens/stock_screen/widgets/stock_item_tile.dart';
import 'package:socials/utils/helpers/database.dart';
import 'package:socials/utils/models/app_state.dart';
import 'package:provider/provider.dart';
import 'package:socials/utils/models/product.dart';


class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getProducts(context.read<AppState>().user!.uid),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.active)
            return Container(
              child: CircularProgressIndicator(),
            );

          else if (snapshot.connectionState == ConnectionState.done && snapshot.data != null){
            List<Product> items = snapshot.data! as List<Product>;

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context,index){
                return StockItemTile(
                  item: items[index],
                );
              },
            );
          } else {
            return Container(
              child: Text("No Products uploaded"),
            );
          }
        },
      ),
    );
  }
}
