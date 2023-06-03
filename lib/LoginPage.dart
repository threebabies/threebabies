import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
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