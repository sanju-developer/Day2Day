import 'package:day2day/screens/notification/notification.dart';

import 'package:flutter/material.dart';

class GroupPageTopbar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 10.0),
          child: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 35.0,
                ),
                color: Theme.of(context).primaryColor,
                tooltip: 'Notification',
                onPressed: () {
                  Navigator.pushNamed(context, NotificationPage.routeName);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
