import 'package:day2day/utils/phone_call.dart';
import 'package:flutter/material.dart';

class MerchantInfoButton extends StatelessWidget {
  final _phoneCall = PhoneCall();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      icon: Icon(Icons.more_vert),
      elevation: 8.0,
      offset: Offset(0, 100),
      color: Colors.white,
      onSelected: (result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Join',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => _phoneCall.launchCall('+91 9999262312'),
                icon: Icon(
                  Icons.done,
                ),
              ),
            ],
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Call',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.call,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
