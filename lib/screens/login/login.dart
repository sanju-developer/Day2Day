import 'package:day2day/blocs/authentication/authentication_bloc.dart';
import 'package:day2day/routes.dart';
import 'package:day2day/screens/login/bloc/login_bloc.dart';
import 'package:day2day/screens/login/widgets/buttons/google_sign_in.dart';
import 'package:day2day/screens/login/widgets/buttons/phone_number_sign_in.dart';
import 'package:day2day/services/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(
      userRepository: RepositoryProvider.of<UserRepository>(context),
    );
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  void _onPressGoogleLoginButton() {
    _loginBloc.add(LoginWithGooglePressed());
  }

  void _onPressPhoneLoginButton() {
    Navigator.pushNamed(
      context,
      Routes.PhoneLoginPageRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocListener<LoginBloc, LoginState>(
        bloc: _loginBloc,
        listener: (context, state) {
          if (state is LoginFailure) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Uh oh! Something went wrong'),
              ),
            );
          }
          if (state is LoginSuccess) {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: _loginBloc,
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'lib/assets/images/login.svg',
                      semanticsLabel: 'Acme Logo',
                      width: 250,
                      height: 200,
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    GoogleSignInButton(
                      onPress: _onPressGoogleLoginButton,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    PhoneSignInButton(
                      onPress: _onPressPhoneLoginButton,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
