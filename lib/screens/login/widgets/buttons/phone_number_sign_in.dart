import 'package:flutter/material.dart';

class PhoneSignInButton extends StatelessWidget {
  final VoidCallback onPress;

  const PhoneSignInButton({Key key, @required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      onPressed: onPress,
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
            child: Text(
              'Sign In with Phone',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
