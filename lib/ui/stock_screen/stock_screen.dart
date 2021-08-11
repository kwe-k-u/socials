import "package:flutter/material.dart";
import 'package:socials/ui/stock_screen/widgets/stock_item_tile.dart';


class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context,index){
          return StockItemTile(
            name: "Iphone 7",
            quantity: 5,
            price: 5000,
          );
        },
      ),
    );
  }
}
