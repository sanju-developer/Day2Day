import 'package:flutter/material.dart';
import 'theme.dart' as Theme;

import 'package:day2day/screens/Groups/Groups.dart';
import 'package:day2day/screens/EntryPage/EntryPage.dart';

void main() {
  runApp(MaterialApp(
    theme: Theme.customThemeData,
    // home: EntryPage(),
    home: GroupsPage(),
  ));
}
