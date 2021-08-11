import "package:flutter/material.dart";
import 'package:socials/ui/broadcast_screen/widgets/broadcast_group_tile.dart';


class BroadcastScreen extends StatefulWidget {
  const BroadcastScreen({Key? key}) : super(key: key);

  @override
  _BroadcastScreenState createState() => _BroadcastScreenState();
}

class _BroadcastScreenState extends State<BroadcastScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [

          BroadCastGroupTile(
            name: "Major buyers"
          )
        ],
      ),
    );
  }
}
