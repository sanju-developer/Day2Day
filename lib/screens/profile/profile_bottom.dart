import 'package:flutter/material.dart';

class ProfileBottom extends StatefulWidget {
  @override
  _ProfileBottomState createState() => _ProfileBottomState();
}

class _ProfileBottomState extends State<ProfileBottom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.edit,
                    size: 20.0,
                    color: Theme.of(context).primaryColor,
                  )),
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Username',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hasFloatingPlaceholder: false,
                    contentPadding: EdgeInsets.symmetric(vertical: 1.0),
                    labelText: 'Vivek Rajoriya'),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Email',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hasFloatingPlaceholder: false,
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    labelText: 'vivekrajoriya106@gmail.com'),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Phone',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hasFloatingPlaceholder: false,
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    labelText: '9999262312'),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Address',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hasFloatingPlaceholder: false,
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    labelText: 'University of California, San Diego'),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30.0),
          child: RaisedButton(
              padding: EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 25.0, right: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Update',
                    style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 22.0),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 28.0,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ))
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
              elevation: 12.0,
              color: Theme.of(context).buttonColor,
              onPressed: () {}),
        )
      ],
    );
  }
}
