import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier{
  User? _user;


  User? get user => this._user;


   set user(User? user) {
    this._user = user;
    notifyListeners();
  }

}