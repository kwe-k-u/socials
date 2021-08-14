
import 'package:socials/utils/APIKEYS.dart';
import 'package:twitter_login/twitter_login.dart';

class Twitter{
  
  
  Future<Map<String,dynamic>> authenticate() async{

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
}