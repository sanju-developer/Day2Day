import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  NotificationPageState createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Color.fromRGBO(247, 246, 243, 1.0),
        title: Row(
          children: <Widget>[
            Text(
              'Notifications',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 24.0),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(
                top: 25.0, bottom: 5.0, left: 15.0, right: 15.0),
            child: ListTile(
              leading: FlutterLogo(size: 30.0),
              title: Text(
                'Three-line ListTile',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                        'A sufficiently long subtitle warrants three lines.'),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Theme.of(context).primaryColorLight)))),
              trailing: Container(
                  child: Text(
                    '02/20',
                    style: TextStyle(
                        color: Theme.of(context).buttonColor,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Theme.of(context).buttonColor)))),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
