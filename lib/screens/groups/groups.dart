import 'package:day2day/screens/groups/bloc/groups_bloc.dart';
import 'package:day2day/screens/groups/widgets/group_page_topbar.dart';
import 'package:day2day/screens/groups/widgets/join_group_btn.dart';
import 'package:day2day/widgets/drawer/drawer.dart';
import 'package:day2day/services/groups_service/groups_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroupsPage extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<GroupsPage> {
  GroupsBloc _groupsBloc;

  @override
  void initState() {
    super.initState();
    _groupsBloc = GroupsBloc(groupsRepository: GroupsRepository());
    _groupsBloc.add(FetchGroups());
  }

  @override
  void dispose() {
    _groupsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDrawer(
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
    );
  }
}
