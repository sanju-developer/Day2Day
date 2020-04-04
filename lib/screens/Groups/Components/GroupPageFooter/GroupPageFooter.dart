import 'package:flutter/material.dart';

import 'package:day2day/Components/AppMenu/AppMenu.dart';

class GroupPageFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).primaryColorLight,
            onPressed: () => {},
            tooltip: 'Menu',
            child: AppMenu(),
          ),
        ],
      ),
    );
  }
}
