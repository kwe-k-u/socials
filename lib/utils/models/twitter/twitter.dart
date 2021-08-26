

import 'package:socials/utils/APIKEYS.dart';
import 'package:socials/utils/models/api_abstract.dart';
import 'package:socials/utils/models/twitter/twitter_dm.dart';
import 'package:socials/utils/models/twitter/twitter_user.dart';
import 'package:twitter_api/utils/models/TwitterUser.dart';
import 'package:twitter_api/utils/twitter_api.dart';
import 'package:twitter_login/twitter_login.dart';

class Twitter extends ApiAbstract{
  TwitterApi? _api;
  String? userId;


  @override
  void login(String consumerKey, String consumerSecret) async{

    _api = TwitterApi(
      token: consumerKey,
      tokenSecret: consumerSecret,
      consumerKey: twitterApiKey,
      consumerSecret: twitterApiSecretKey,);

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
  Future<List<TwitterAccount>> getFriends() async{
    List<Map<String,dynamic>> map =  await this._api!.getFollowers(
      userId: this.userId,
          count: 200
    );

    List<TwitterAccount> users = [];
    map.forEach((element) {
      users.add(TwitterAccount.fromJson(element));
    });

    return users;
  }

  @override
  Future<List<TwitterDM>> getMessages() async{
    List<TwitterDM>  messages = [];
    await _api!.getMessages().then((value) {
      value.forEach((element) {
        messages.add(TwitterDM.fromJson(element));
      });
    });

    return messages;
  }





  Future<String> getUserById(String id) async {
    Map<String, dynamic> map = await this._api!.getUserData(id: id);
    return map["screen_name"];
  }


  Future<String> getUserId() async {
    String id;
    Map<String, dynamic> data = await this._api!.verifyCredentials();
    id = data["id_str"];
    return id;
  }

  @override
  Future<void> sendMessage(String message, identifier) async{
   var res =  await this._api!.sendMessage(recipientId: identifier, message: message);

   print("body ${res.body}");
   print("statusCode ${res.statusCode}");
   print("header ${res.headers}");
   print("reason ${res.reasonPhrase}");  }



}