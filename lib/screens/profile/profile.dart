import 'package:day2day/screens/profile/profile_bottom.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            centerTitle: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Stack(
              children: <Widget>[
                Text(
                  'Profile',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700),
                ),
                Positioned(
                  right: 0.0,
                  top: 30.0,
                  child: IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.edit,
                        size: 30.0,
                        color: Theme.of(context).primaryColor,
                      )),
                )
              ],
            )),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      foregroundColor: Theme.of(context).primaryColorLight,
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 30.0,
                      child: SvgPicture.asset(
                        'lib/assets/images/profilePic.svg',
                        semanticsLabel: 'Acme Logo',
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                ProfileBottom()
              ],
            ),
          ),
        ));
  }
}
