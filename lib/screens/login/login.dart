import 'package:day2day/routes.dart';
import 'package:day2day/screens/login/widgets/login_form.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'lib/assets/images/login.svg',
              semanticsLabel: 'Acme Logo',
              width: 250,
              height: 200,
            ),
            Center(
                child: Container(
              child: LoginForm(),
            )),
            Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Don\'t have an account! ',
                        style: Theme.of(context).textTheme.body1),
                    FlatButton(
                      child: Text(
                        'Sign up here',
                        style: Theme.of(context).textTheme.body1,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.RegisterPageRoute,
                        );
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
