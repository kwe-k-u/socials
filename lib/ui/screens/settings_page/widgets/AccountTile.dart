import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:socials/utils/enums/platform_enum.dart';


class AccountTile extends StatelessWidget {
final  Map<PlatformEnum, Map<String,String>> account;
  const AccountTile({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: _AccountIcon(platform: account.keys.first,),
        title: Text(account.keys.first.toString()),
        subtitle: Text("username"),
      );
  }
}





class _AccountIcon extends StatelessWidget {
  final PlatformEnum platform;
  const _AccountIcon({Key? key, required this.platform}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (this.platform){

      case PlatformEnum.facebook:
        return Icon(Icons.facebook_rounded);
      case PlatformEnum.snapchat:
        return Icon(Ionicons.logo_snapchat);
      case PlatformEnum.instagram:
        return Icon(Ionicons.logo_instagram);
      case PlatformEnum.twitter:
        return Icon(Ionicons.logo_twitter);
    }
  }
}

