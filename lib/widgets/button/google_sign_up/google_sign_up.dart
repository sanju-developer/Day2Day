import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class GoogleSignUpButton extends StatefulWidget {
  @override
  _GoogleSignUpButtonState createState() => _GoogleSignUpButtonState();
}

class _GoogleSignUpButtonState extends State<GoogleSignUpButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30.0),
      child: RaisedButton(
          color: Colors.white,
          onPressed: () {},
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
