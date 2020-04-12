import 'package:flutter/material.dart';
import 'package:day2day/screens/groups/widgets/group_page_topbar.dart';
import 'package:day2day/screens/groups/widgets/join_group_btn.dart';
import 'package:day2day/widgets/drawer/drawer.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:day2day/theme.dart' as Theme;

class GroupsPage extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.customThemeData,
        home: AnimatedDrawer(
          child: Scaffold(
            appBar: GroupPageTopbar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'lib/assets/images/no-group.svg',
                    semanticsLabel: 'Acme Logo',
                    width: 250,
                    height: 200,
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: ModalBottomSheetDemo())
                ],
              ),
            ),
          ),
        ));
  }
}
