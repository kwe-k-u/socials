

import 'package:firebase_database/firebase_database.dart';
import 'package:socials/utils/enums/platform_enum.dart';

class PlatformKeys{
  Map<String, String> keys = {};

  PlatformKeys(DataSnapshot? data){
    if (data != null){
      keys = data.value ?? {};
    }
  }

   void addKey({required PlatformEnum platform, required String key}){
    keys[platform.toString().split('.')[1]] = key;
  }
}