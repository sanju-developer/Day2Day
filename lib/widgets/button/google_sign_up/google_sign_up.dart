import 'package:flutter/material.dart';
// import 'package:day2day/screens/groups/groups.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignUpButton extends StatefulWidget {
  @override
  _GoogleSignUpButtonState createState() => _GoogleSignUpButtonState();
}

class _GoogleSignUpButtonState extends State<GoogleSignUpButton> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30.0),
      child: RaisedButton(
          color: Colors.white,
          onPressed: () {
            signInWithGoogle()
                .then((user) => print(user))
                .catchError((e) => print(e));
            // signInWithGoogle().whenComplete(() {
            //   // print()
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) {
            //         return GroupsPage();
            //       },
            //     ),
            //   );
            // });
          },
          elevation: 8.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset(
                'lib/assets/images/sig.svg',
                semanticsLabel: 'Acme Logo',
                width: 100,
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 12.0, top: 7.0, bottom: 5.0),
                child: Text('Sign up with google',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
              )
            ],
          )),
    );
  }
}
