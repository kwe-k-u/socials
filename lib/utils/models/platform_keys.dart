import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:socials/utils/enums/platform_enum.dart';



class PlatformKeys extends ChangeNotifier{
  Map<PlatformEnum, Map<String, String>> keys = {};

  PlatformKeys(DataSnapshot? data){
    if (data != null) {

      data.value.forEach((key, value) {
      switch (key) {
        case "twitter":
          keys[PlatformEnum.twitter] = {
            "access_token" : value["access_token"],
            "access_token_secret" : value["access_token_secret"],
          };
          break;
        case "snapchat":
          keys[PlatformEnum.snapchat] = value as Map<String, String>;
          break;
        case "instagram":
          keys[PlatformEnum.instagram] = value as Map<String, String>;
          break;
        case "facebook":
          keys[PlatformEnum.facebook] = value as Map<String, String>;
          break;
      }
    });
    }
  }

   void addKey({required PlatformEnum platform, required Map<String, String> key}){
    keys[platform] = key;
    notifyListeners();
  }
}