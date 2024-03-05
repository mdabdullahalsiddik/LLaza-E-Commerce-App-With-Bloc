import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthRepositories {
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      if (googleSignInAccount == null) {
        // User canceled the sign-in process
        debugPrint("User canceled the signin process.");
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
      );

      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint('User: ${authResult.user?.email}');
      return authResult.user;
    } catch (error) {
      debugPrint("Error signing in with Google: $error");
      return null;
    }
  }

  Future<User?> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint("Facebook login success: ${authResult.user?.displayName}");
        return authResult.user;
      } else {
        debugPrint("Facebook login failed: ${result.message}");
        return null;
      }
    } catch (error) {
      debugPrint("Error signing in with Facebook: $error");
      return null;
    }
  }

  Future<User?> signInWithTwitter() async {
    try {
      final TwitterLogin twitterLogin = TwitterLogin(
          apiKey: "3HZmwn8nfaRU1BeIuiFrrjCdx",
          apiSecretKey: "2ZTsdUy1ceJLykhBXmZReXUh9bmv72RoBxB1O3GFP68RAh5oDm",
          redirectURI: "Laza://");
      final result = await twitterLogin.loginV2();
      if (result.status == TwitterLoginStatus.loggedIn) {
        final credential = TwitterAuthProvider.credential(
            accessToken: result.authToken!, secret: result.authTokenSecret!);
        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint("Twitter login success: ${authResult.user?.displayName}");
        return authResult.user;
      } else {
        debugPrint("Twitter login failed: ${result.errorMessage}");
        return null;
      }
    } catch (error) {
      debugPrint("Error signing in with Twitter: $error");
      return null;
    }
  }
}
