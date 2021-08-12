import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socials/utils/helpers/helper.dart';




final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

///Signs the mercury user in returning the user object or null (if no account with that email exists
///or that account does not have an associated apikey)









Future<User?>? firebaseSignUpWithEmail({
  required String email,
  required String password,
  required BuildContext context
}) async{

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;


  try {

    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    userCredential.user!.sendEmailVerification();

    // Once signed in, return the UserCredential
    UserCredential credential =  await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = credential.user!;
    // user.providerData.
    // OAuthCredential oauth = OAuthCredential(signInMethod: '', providerId: '');
    // user.linkWithCredential(oauth);//todo implement
    // firebaseAuth.currentUser.

    assert(!user.isAnonymous);
    // assert (await user.getIdToken() != null);

    final User currentUser = firebaseAuth.currentUser!;
    //update display name
    // await currentUser.updateDisplayName( username); //todo implement
    //update phone number
    // await updateUserPhoneNumber(phoneNumber, currentUser); //todo implement

    assert(currentUser.uid == user.uid);
    // await user.reload();
    return user;


  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showSnack(context: context, message: "Your password is too weak", backgroundColor: Colors.red);
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      showSnack(context: context, message: "An account exists with that email", backgroundColor: Colors.red);
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  // return null;
}



///Authenticate user with log in details for account [email] and [password]
Future<User?>? firebaseLogInWithEmail({
  required BuildContext context,
  required String email,
  required String password}) async{

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  try {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(
        email: email,
        password: password);
    // print(userCredential.toString());
    // Once signed in, return the UserCredential

    User user = userCredential.user!;

    final User currentUser = firebaseAuth.currentUser!;
    assert(currentUser.uid == user.uid);

    return user;


  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
      showSnack(context: context, message: "This email is not registered for this service", backgroundColor: Colors.red);
      print('Account does not exist.');
    } else if (e.code == "wrong-password"){

      showSnack(context: context, message: "Wrong password entered", backgroundColor: Colors.red);
      print('Wrong password');
    } else if (e.code == "invalid-email"){

      showSnack(context: context, message: "Invalid email: Retype your email", backgroundColor: Colors.red);
      print('invalid-email');
    } else if (e.code == "network-request-failed"){

      showSnack(context: context, message: "Not connected to the Internet", backgroundColor: Colors.red);
      print('Connection timeout');
    } else {
      print(e);
    }
  }
  return null;
}



Future<void> firebaseSignOut() async{
  await firebaseAuth.signOut();

}

