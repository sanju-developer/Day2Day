import 'package:flutter/material.dart';

enum WhyFarther { yourGroups, profile, notification, help }

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<WhyFarther>(
      elevation: 10.0,
      onSelected: (WhyFarther result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        PopupMenuItem<WhyFarther>(
          value: WhyFarther.yourGroups,
          child: Row(
            children: <Widget>[
              Icon(Icons.assignment),
              Container(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Your Groups'),
              )
            ],
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem<WhyFarther>(
          value: WhyFarther.profile,
          child: Row(
            children: <Widget>[
              Icon(Icons.person),
              Container(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Profile'),
              )
            ],
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem<WhyFarther>(
          value: WhyFarther.notification,
          child: Row(
            children: <Widget>[
              Icon(Icons.notifications),
              Container(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Profile'),
              )
            ],
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem<WhyFarther>(
          value: WhyFarther.help,
          child: Row(
            children: <Widget>[
              Icon(Icons.help),
              Container(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Help'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
