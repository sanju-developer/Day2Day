import 'package:day2day/widgets/drawer/drawer.dart';
import 'package:day2day/screens/groups/groups.dart';
// import 'package:day2day/screens/entry_page/entry_page.dart';

import 'package:flutter/material.dart';
import 'theme.dart' as Theme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Widget child = EntryPage();
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
