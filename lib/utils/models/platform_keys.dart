

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:socials/utils/enums/platform_enum.dart';

class PlatformKeys extends ChangeNotifier{
  Map<PlatformEnum, Map<String, String>> keys = {};

  PlatformKeys(DataSnapshot? data){
    if (data != null){
      keys = data.value ?? {};
    }
  }

   void addKey({required PlatformEnum platform, required Map<String, String> key}){
    keys[platform] = key;
    notifyListeners();
  }
}