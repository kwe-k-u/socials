

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:socials/utils/enums/platform_enum.dart';


class PlatformIconWidget extends StatelessWidget {
  final PlatformEnum platform;
  const PlatformIconWidget({
    Key? key,
    required this.platform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    switch (this.platform){

      case PlatformEnum.facebook:
        return Icon(Ionicons.logo_facebook);
      case PlatformEnum.snapchat:
        return Icon(Ionicons.logo_snapchat);
      case PlatformEnum.instagram:
        return Icon(Ionicons.logo_instagram);
      case PlatformEnum.twitter:
        return Icon(Ionicons.logo_twitter);
    }
  }
}
