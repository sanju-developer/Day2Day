import 'package:flutter/material.dart';

class _BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            child: Center(
              child: Text('qwerty'),
            ),
          ),
          Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('qwerty'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ModalBottomSheetDemo extends StatelessWidget {
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return _BottomSheetContent();
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
