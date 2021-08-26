
import 'package:socials/utils/models/user_abstract.dart';

class TwitterAccount extends UserAbstract{
  TwitterAccount(
      {required String username, 
        required String id,
        String? imageUrl,
      }) : super(userName: username, id: id, imageUrl: imageUrl);
  
  
  
  
  factory TwitterAccount.fromJson(Map<String, dynamic> map){
    return TwitterAccount(
        username: map["screen_name"],
        id: map["id_str"]
    );
  }
  
}