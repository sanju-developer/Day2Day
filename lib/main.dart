import 'package:day2day/Components/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'screens/Groups/Groups.dart';
import 'theme.dart' as Theme;

import 'package:day2day/screens/Groups/Groups.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget child = GroupsPage();
    Widget home = AnimatedDrawer(
      child: child,
    );

    return MaterialApp(
      theme: Theme.customThemeData,
      home: home,
    );
  }
}
