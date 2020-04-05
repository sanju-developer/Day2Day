import 'package:day2day/Components/_SizeRoute/_SizeRoute.dart';
import 'package:day2day/screens/NotificationPage/NotificationPage.dart';
import 'package:day2day/screens/ProfilePage/ProfilePage.dart';

import 'package:flutter/material.dart';

class GroupPageTopbar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.account_circle,
                          size: 35.0,
                        ),
                        color: Theme.of(context).primaryColor,
                        tooltip: 'Profile',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text('Vivek Rajoriya',
                            style: Theme.of(context).textTheme.title),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      size: 35.0,
                    ),
                    color: Theme.of(context).primaryColor,
                    tooltip: 'Notification',
                    onPressed: () {
                      Navigator.push(
                          context, SizeRoute(page: NotificationPage()));
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
