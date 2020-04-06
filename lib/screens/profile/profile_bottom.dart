import 'package:flutter/material.dart';

class ProfileBottom extends StatefulWidget {
  @override
  _ProfileBottomState createState() => _ProfileBottomState();
}

class _ProfileBottomState extends State<ProfileBottom> {
  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: <Widget>[
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            "lib/assets/images/pi.png",
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomLeft,
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('Edit'),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Address',
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                      padding: EdgeInsets.only(
                          top: 5.0, bottom: 5.0, left: 25.0, right: 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Update',
                            style: TextStyle(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                fontSize: 22.0),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.arrow_forward,
                                size: 28.0,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ))
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      elevation: 12.0,
                      color: Theme.of(context).buttonColor,
                      onPressed: () {}),
                )
              ],
            ),
          ),
        )
      ],
    );
    //   ],
    // );
  }
}
