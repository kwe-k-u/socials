import 'package:flutter/material.dart';


class BroadCastGroupTile extends StatelessWidget {
  final String name;
  const BroadCastGroupTile({Key? key,
  required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.announcement),
        title: Text(name),
        subtitle: Text("Kofi and 30 others"),
      );
  }
}
