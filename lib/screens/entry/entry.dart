import 'package:day2day/blocs/authentication/authentication_bloc.dart';
import 'package:day2day/screens/groups/groups.dart';
import 'package:day2day/screens/login/login.dart';
import 'package:day2day/screens/splash/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationUnintialized) {
          return SplashPage();
        }
        if (state is AuthenticationSuccess) {
          return GroupsPage();
        }
        if (state is AuthenticationFailure) {
          return LoginPage();
        }
        if (state is AuthenticationInProgress) {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
