import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socials/utils/enums/platform_enum.dart';
import 'package:socials/utils/helpers/database.dart';
import 'package:socials/utils/models/platform_keys.dart';

class AppState extends ChangeNotifier{
  User? _user;
  PlatformKeys? keys;


  User? get user => this._user;
  // PlatformKeys? get keys => this._keys;


  // set keys(PlatformKeys? key){
  //   this._keys = key;
  //   notifyListeners();
  // }


   set user(User? user) {
    this._user = user;
    if (user != null)
    getKeys(user.uid).then((value) {
      keys = new PlatformKeys(value);
    });
    else
      keys = null;
    notifyListeners();
  }


  // void addKey({required PlatformEnum platform, required String key}){
  //    this.keys!.keys[platform.toString().split(".")[1]] = key;
  //    updatePlatforms(id: user!.uid, keys: keys!);
  // }

}