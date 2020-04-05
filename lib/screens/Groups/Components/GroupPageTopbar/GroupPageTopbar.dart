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
                      Icon(
                        Icons.account_circle,
                        size: 35.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Vivek Rajoriya',
                            style: Theme.of(context).textTheme.title),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.notifications,
                    size: 35.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
