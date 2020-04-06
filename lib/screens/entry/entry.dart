import 'package:day2day/screens/register/register.dart';
import 'package:day2day/screens/entry/widgets/introduction.dart';
import 'package:day2day/screens/login/login.dart';

import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
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
          child: ListView(shrinkWrap: true, children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset('lib/assets/images/login-background.png',
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat,
                      alignment: Alignment.center),
                ),
                Container(child: Introduction()),
                Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 130,
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          elevation: 12.0,
                          child: Text('Sign in',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 35),
                      SizedBox(
                        width: 130,
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          elevation: 12.0,
                          child: Text('Sign up',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ]),
        ));
  }
}
