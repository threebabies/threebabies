import 'package:baby/Account/FirebaseUtils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseUtils().app == null ? FirebaseAuth.instance : FirebaseAuth.instanceFor(app: FirebaseUtils().app!);
  final _googleSignIn = GoogleSignIn(
      clientId: "336744937807-4b594bhe1nc46s87hr8ajnm8upf6taqr.apps.googleusercontent.com",
  );
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                try {
                  final googleUser = await _googleSignIn.signIn();
                  final googleAuth;
                  if(googleUser !=null) {
                     googleAuth = await googleUser.authentication;
                     final credential = GoogleAuthProvider.credential(
                       accessToken: googleAuth.accessToken,
                       idToken: googleAuth.idToken,
                     );
                     final user = await _auth.signInWithCredential(credential);
                     if (user != null) {
                       // Navigate to home page
                     }
                  }
                } catch (e) {
                  print(e);
                  // Show error message
                } finally {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              child: Text('Sign in with Google'),
            ),
            SignInWithAppleButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                try {
                  final credential = await SignInWithApple.getAppleIDCredential(
                    scopes: [
                      AppleIDAuthorizationScopes.email,
                      AppleIDAuthorizationScopes.fullName,
                    ],
                  );
                  final user = await _auth.signInWithCredential(
                    OAuthProvider('apple.com').credential(
                      idToken: credential.identityToken,
                      accessToken: credential.authorizationCode,
                    ),
                  );
                  if (user != null) {
                    // Navigate to home page
                  }
                } catch (e) {
                  print(e);
                  // Show error message
                } finally {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}