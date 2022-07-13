import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FacebookSignIn  {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      // Create a credential from the access token
      final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      final  user = await FirebaseAuth.instance.signInWithCredential(credential);
      print (user.user?.photoURL);
      print("isAnonymous");
      print( user.user?.isAnonymous);
      print (user.user?.email);
      return user;
    }
    return null;
  }

}