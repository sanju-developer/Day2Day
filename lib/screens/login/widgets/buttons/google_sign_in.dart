import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPress;

  const GoogleSignInButton({Key key, @required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.white,
        onPressed: onPress,
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
              child: Text(
                "Sign In with Google",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
