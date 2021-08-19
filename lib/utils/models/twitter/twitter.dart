
import 'dart:convert';

import 'package:socials/utils/APIKEYS.dart';
import 'package:socials/utils/models/api_abstract.dart';
import 'package:socials/utils/models/twitter/twitter_dm.dart';
import 'package:twitter_api/utlils/twitter_api.dart';
import 'package:twitter_login/twitter_login.dart';

class Twitter extends ApiAbstract{
  TwitterApi? _api;
  String? _screenName;


  @override
  void login() async{

    _api = TwitterApi(
      token: twitterAccessToken,
      consumerKey: twitterApiKey,
      consumerSecret: twitterApiSecretKey,
      tokenSecret: twitterAccessTokenSecret,);

  }



  Future<Map<String,dynamic>> authenticate() async{
//todo implement
    final twitterLogin = TwitterLogin(
      // Consumer API keys
      apiKey: twitterApiKey,
      // Consumer API Secret keys
      apiSecretKey: twitterApiSecretKey,
      // Registered Callback URLs in TwitterApp
      // Android is a deeplink
      // iOS is a URLScheme
      redirectURI: twitterRedirectUri,
    );
    final authResult = await twitterLogin.login();
    Map<String, dynamic> response = {
      "status" : authResult.status
    };
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        print("success");
        // success
        response["authToken"] = authResult.authToken!;
        response["authTokenSecret"] = authResult.authTokenSecret!;
        break;

      case null:
      case TwitterLoginStatus.cancelledByUser:
      case TwitterLoginStatus.error:
    }

    return response;
  }

  @override
  Future<dynamic> getFriends() async{
    return await this._api!.getFollowers();
  }

  @override
  Future<List<TwitterDM>> getMessages() async{
    List<TwitterDM>  messages = [];
    _api!.getMessages().then((value) {
      value.forEach((element) {
        messages.add(TwitterDM.fromJson(element));
      });
    });

    return messages;
  }

  @override
  void sendMessage(String message, identifier) {
    // TODO: implement sendMessage
  }



}