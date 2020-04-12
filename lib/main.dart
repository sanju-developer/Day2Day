import 'package:day2day/screens/entry/entry.dart';

import 'package:flutter/material.dart';
import 'theme.dart' as Theme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget child = EntryPage();

    return MaterialApp(
      theme: Theme.customThemeData,
      home: child,
    );
  }
}
