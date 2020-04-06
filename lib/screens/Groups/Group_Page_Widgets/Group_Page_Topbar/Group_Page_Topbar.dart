import 'package:day2day/widgets/size_route/size_route.dart';
import 'package:day2day/screens/notification_page/notification_page.dart';

import 'package:flutter/material.dart';

class GroupPageTopbar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
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
                  Navigator.push(context, SizeRoute(page: NotificationPage()));
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
