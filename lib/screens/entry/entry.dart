import 'package:day2day/widgets/button/google_sign_up/google_sign_up.dart';
import 'package:day2day/widgets/button/sign_up_with_phone/sign_up_with_phone_btn.dart';

import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
  static const String routeName = '/';
  @override
  State<StatefulWidget> createState() {
    return _EntryPageState();
  }
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[GoogleSignUpButton(), PhoneSignUpButton()],
        ),
      ),
    );
  }
}
