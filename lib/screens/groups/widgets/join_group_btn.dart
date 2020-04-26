import 'package:flutter/material.dart';
import 'package:day2day/screens/groups/widgets/group_page_body.dart';

class ModalBottomSheetDemo extends StatelessWidget {
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
            heightFactor: 0.8, child: BottomSheetContent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(8.0),
      ),
      onPressed: () => _showModalBottomSheet(context),
      color: Theme.of(context).accentColor,
      padding:
          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // Replace with a Row for horizontal icon + text
        children: <Widget>[
          Icon(
            Icons.add,
            color: Theme.of(context).primaryColor,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Join Group",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
