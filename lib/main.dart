import 'package:day2day/bloc_delegate.dart';
import 'package:day2day/blocs/authentication/authentication_bloc.dart';
import 'package:day2day/routes.dart';
import 'package:day2day/screens/my_group/my_group.dart';
import 'package:day2day/services/user.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme.dart' as Theme;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted()),
      ),
    ],
    child: RepositoryProvider<UserRepository>(
      create: (context) => userRepository,
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.customThemeData,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
