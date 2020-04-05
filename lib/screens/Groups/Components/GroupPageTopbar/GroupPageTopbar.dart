import 'package:flutter/material.dart';

class GroupPageTopbar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: <Widget>[
        Icon(
          Icons.notifications,
          size: 35.0,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
