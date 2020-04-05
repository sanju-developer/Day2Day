import 'package:flutter/material.dart';

import 'package:day2day/screens/ProfilePage/ProfilePage.dart';

enum WhyFarther { yourGroups, profile, notification, help }

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<WhyFarther>(
      elevation: 10.0,
      onSelected: (WhyFarther result) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        PopupMenuItem<WhyFarther>(
          value: WhyFarther.yourGroups,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.assignment),
                  Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text('Your Groups'),
                  )
                ],
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem<WhyFarther>(
          value: WhyFarther.profile,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.notifications),
                  Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text('Notifications'),
                  )
                ],
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem<WhyFarther>(
          value: WhyFarther.notification,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.people),
                  Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text('Profile'),
                  )
                ],
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem<WhyFarther>(
          value: WhyFarther.help,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.help),
                  Container(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text('Help'),
                  )
                ],
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
      ],
    );
  }
}
