import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socials/utils/enums/platform_enum.dart';
import 'package:socials/utils/helpers/database.dart';
import 'package:socials/utils/models/general_message_models/message_abstract.dart';
import 'package:socials/utils/models/general_message_models/message_list.dart';
import 'package:socials/utils/models/general_message_models/message_thread.dart';
import 'package:socials/utils/models/twitter/twitter.dart';
import 'package:socials/utils/models/platform_keys.dart';
import 'package:socials/utils/models/twitter/twitter_dm.dart';

class AppState extends ChangeNotifier{
  User? _user;
  PlatformKeys? keys;
  User? get user => this._user;
  Twitter? twitter;
  MessageList _messageList = MessageList();





  Future<List<MessageThread>?> get facebookMessages async {
    //if we have the key then we have access to the messages on the platform
    if (_givenAccess(PlatformEnum.facebook)){
      return this._messageList.getFacebookMessages();
    }
    return null;

  }


  Future<List<MessageThread>?> get instagramMessages async {
    //if we have the key then we have access to the messages on the platform
    if (_givenAccess(PlatformEnum.instagram)){
      return this._messageList.getInstagramMessages();
    }
    return null;

  }


  Future<List<MessageThread>?> get snapchatMessages async {
    //if we have the key then we have access to the messages on the platform
    if (_givenAccess(PlatformEnum.snapchat)){
      return this._messageList.getSnapchatMessages();
    }
    return null;

  }

  Future<List<MessageThread>?> get twitterMessages async {
    //if we have the key then we have access to the messages on the platform
    if (_givenAccess(PlatformEnum.twitter)){
      if (this._messageList.getTwitterMessages().isEmpty && this.twitter != null)
        this._messageList.addList( await twitter!.getMessages(), PlatformEnum.twitter);
      return this._messageList.getTwitterMessages();
    }
    return null;

  }


  bool _givenAccess(PlatformEnum platform){
    if (this.keys == null)
      return false;
    return this.keys!.keys.containsKey(platform);
  }


   set user(User? user) {
    this._user = user;
    if (user != null)
    getKeys(user.uid).then((value) {
      keys = new PlatformKeys(value);
      keys!.keys.keys.forEach((element) async {

        //Setting up apis for each social media platform
        switch (element){

          case PlatformEnum.facebook:
            // TODO: Handle this case.
            break;
          case PlatformEnum.snapchat:
            // TODO: Handle this case.
            break;
          case PlatformEnum.instagram:
            // TODO: Handle this case.m
            break;
          case PlatformEnum.twitter:
            this.twitter = Twitter();
            this.twitter!.login();
            List<MessageAbstract> list = await this.twitter!.getMessages();
            this._messageList.addList(list, PlatformEnum.twitter);
            break;
        }
      });
    });
    else
      keys = null;
    notifyListeners();
  }


  void addKey({
    required PlatformEnum platform,
    required Map<String, String> keyMap}){
     if (this.keys == null)
       this.keys = PlatformKeys(null);
     this.keys!.keys[platform] = keyMap;
     updatePlatforms(id: user!.uid, keys: keys!);
  }

}