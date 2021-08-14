
import 'package:twitter_login/twitter_login.dart';

class Twitter{
  
  
  Future<void> authenticate() async{

    final twitterLogin = TwitterLogin(
      // Consumer API keys
      apiKey: '',
      // Consumer API Secret keys
      apiSecretKey: '',
      // Registered Callback URLs in TwitterApp
      // Android is a deeplink
      // iOS is a URLScheme
      redirectURI: '',
    );
    final authResult = await twitterLogin.login();

    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        print("success");
        // success
        break;
      case null:
        print("null");
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