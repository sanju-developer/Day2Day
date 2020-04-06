import 'package:day2day/screens/register/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:day2day/screens/login/login.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Text('Sign Up',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: RegisterForm(),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 30),
                          child: FlatButton(
                            child: Text('Wanna login ? ',
                                style: Theme.of(context).textTheme.body1),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                          ))
                    ],
                  ))
            ],
          ),
        ));
  }
}
