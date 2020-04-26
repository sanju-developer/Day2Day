import 'package:flutter/material.dart';
import 'package:day2day/routes.dart';
import 'package:day2day/screens/groups/bloc/groups_bloc.dart';
import 'package:day2day/services/groups_service/groups_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetContent extends StatefulWidget {
  @override
  __BottomSheetContentState createState() => __BottomSheetContentState();
}

class __BottomSheetContentState extends State<BottomSheetContent> {
  GroupsBloc _groupsBloc;
  final GroupsRepository groupsRepository = GroupsRepository();

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
    return BlocProvider(
      create: (context) => GroupsBloc(groupsRepository: groupsRepository),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 90,
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
              child: Center(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Search group to join group',
                    counterText: "",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  ),
                ),
              ),
            ),
            Divider(thickness: 1),
            Expanded(
              child: BlocBuilder<GroupsBloc, GroupsState>(
                bloc: _groupsBloc,
                builder: (BuildContext context, state) {
                  if (state is GetGroupsFailure) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Uh oh! Something went wrong'),
                      ),
                    );
                  } else if (state is GetGroupsInProgress) {
                    CircularProgressIndicator();
                  } else if (state is GetGroupsSuccess) {
                    return ListView.builder(
                      itemCount: state.groups.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 5.0, left: 15.0, right: 15.0),
                          child: Card(
                            elevation: 8.0,
                            child: ListTile(
                              onTap: () => Navigator.pushNamed(
                                  context, Routes.MerchantPageRoute),
                              leading: FlutterLogo(size: 72.0),
                              title: Text(
                                state.groups[index].data['name'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              subtitle: Text(
                                  'A sufficiently long subtitle warrants three lines.'),
                              trailing: Icon(
                                Icons.verified_user,
                                color: Theme.of(context).primaryColor,
                              ),
                              isThreeLine: true,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
