import 'package:day2day/routes.dart';
import 'package:flutter/material.dart';
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
  List<int> groupRating = List(5);
  final GroupsRepository groupsRepository = GroupsRepository();

  @override
  void initState() {
    super.initState();
    _groupsBloc = GroupsBloc(groupsRepository: GroupsRepository());
    _groupsBloc.add(FetchGroups());
  }

  List<Icon> _starsForRatings(_rating) {
    List<Icon> stars = [];
    for (int i = 0; i < _rating; i++) {
      stars.add(Icon(Icons.favorite,
          color: Color.fromRGBO(248, 188, 155, 1), size: 22.0));
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _groupsBloc,
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
                    labelText: 'Search to join group...',
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
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Fetching near by groups...'),
                        SizedBox(
                          height: 10.0,
                        ),
                        CircularProgressIndicator(),
                      ],
                    ));
                  } else if (state is GetGroupsSuccess) {
                    return ListView.builder(
                      itemCount: state.groups.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 5.0, left: 15.0, right: 15.0),
                          child: Card(
                            color: Theme.of(context).primaryColor,
                            elevation: 6.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            FlutterLogo(size: 25.0),
                                            Container(
                                              width: 250.0,
                                              padding:
                                                  EdgeInsets.only(left: 6.0),
                                              child: Text(
                                                state
                                                    .groups[index].data['name'],
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      state.groups[index].data['verified']
                                          ? Icon(
                                              Icons.verified_user,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    state.groups[index].data['description'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.0),
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.gps_fixed,
                                          color:
                                              Color.fromRGBO(227, 221, 52, 1)),
                                      SizedBox(width: 8.0),
                                      Expanded(
                                        child: Text(
                                          state.groups[index].data['address'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  227, 221, 52, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.call_made,
                                          color:
                                              Color.fromRGBO(248, 155, 155, 1)),
                                      SizedBox(width: 8.0),
                                      Expanded(
                                        child: Text(
                                          state.groups[index].data['phone'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  248, 155, 155, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: _starsForRatings(
                                            state.groups[index].data['rating']),
                                      ),
                                      FloatingActionButton(
                                        mini: true,
                                        backgroundColor: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              Routes.MerchantPageRoute);
                                        },
                                        child: Icon(Icons.arrow_forward_ios),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
