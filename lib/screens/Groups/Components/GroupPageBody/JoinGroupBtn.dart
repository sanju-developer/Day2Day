import 'package:flutter/material.dart';

class _BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 90,
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
            child: Center(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Search group to join group',
                  counterText: "",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                ),
              ),
            ),
          ),
          Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 5.0, left: 15.0, right: 15.0),
                  child: Card(
                    elevation: 8.0,
                    child: ListTile(
                      leading: FlutterLogo(size: 72.0),
                      title: Text(
                        'Three-line ListTile',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      subtitle: Text(
                          'A sufficiently long subtitle warrants three lines.'),
                      trailing: Icon(
                        Icons.verified_user,
                        color: Theme.of(context).primaryColor,
                      ),
                      isThreeLine: true,
                    ),
                  ),
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
