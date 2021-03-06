import 'package:day2day/blocs/authentication/authentication_bloc.dart';
import 'package:day2day/routes.dart';
import 'package:day2day/screens/login/bloc/login_bloc.dart';
import 'package:day2day/screens/login/widgets/buttons/google_sign_in.dart';
import 'package:day2day/screens/login/widgets/buttons/phone_number_sign_in.dart';
import 'package:day2day/services/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    GoogleSignInButton(
                      onPress: _onPressGoogleLoginButton,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    PhoneSignInButton(
                      onPress: _onPressPhoneLoginButton,
                    ),
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
