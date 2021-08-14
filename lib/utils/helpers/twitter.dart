
import 'package:socials/utils/APIKEYS.dart';
import 'package:twitter_login/twitter_login.dart';

class Twitter{
  
  
  Future<Map<String,String>?> authenticate() async{

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

    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        print("success");
        // success
        return {
          "authToken" : authResult.authToken!,
          "authTokenSecret" : authResult.authTokenSecret!,
        };

      case null:
        break;
      case TwitterLoginStatus.cancelledByUser:
      // cancel

        print("cancelled");
        break;
      case TwitterLoginStatus.error:
      // error
        print("error");
        break;
    }
  }
}