import 'package:flutter/material.dart';


class FriendListTile extends StatelessWidget {
  final String username;
  final void Function() onTap;
  const FriendListTile({
    Key? key,
    required this.username,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(username),
    );
  }
}
