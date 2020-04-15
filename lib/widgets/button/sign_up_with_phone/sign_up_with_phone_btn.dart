import 'package:day2day/routes.dart';
import 'package:flutter/material.dart';

class PhoneSignUpButton extends StatefulWidget {
  @override
  _PhoneSignUpButtonState createState() => _PhoneSignUpButtonState();
}

class _PhoneSignUpButtonState extends State<PhoneSignUpButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.white,
        onPressed: () =>
            Navigator.pushNamed(context, Routes.SignupWithPhoneRoute),
        elevation: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(
              'https://img.icons8.com/plasticine/2x/iphone-x.png',
              width: 44.0,
              height: 50.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 5.0, top: 7.0, bottom: 5.0),
              child: Text('Sign up with Phone',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ));
  }
}
