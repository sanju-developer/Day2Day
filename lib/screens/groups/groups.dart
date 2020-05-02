import 'package:day2day/routes.dart';
import 'package:day2day/screens/groups/widgets/group_page_topbar.dart';
import 'package:day2day/screens/groups/widgets/join_group_btn.dart';
import 'package:day2day/widgets/drawer/drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroupsPage extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedDrawer(
      child: Scaffold(
        appBar: GroupPageTopbar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.MyGroupPageRoute);
                },
                child: Text('Goto my group details'),
              ),
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
    );
  }
}
