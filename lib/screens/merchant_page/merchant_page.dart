import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MerchantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          // The containers in the background
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50.0, left: 10.0, right: 20.0),
                height: MediaQuery.of(context).size.height * .45,
                color: Theme.of(context).primaryColorLight,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/140x100',
                                    ),
                                  ),
                                  Icon(
                                    Icons.verified_user,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Water Supplier',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 30.0),
                            ),
                            Text(
                              'Cecilia Chapman 711-2880 Nulla St. Mankato Mississippi 96522 (257) 563-7401',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
              ),
            ],
          ),
          // The card widget with top padding,
          // incase if you wanted bottom padding to work,
          // set the `alignment` of container to Alignment.bottomCenter
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .40,
                right: 10.0,
                left: 10.0,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40))),
                  color: Colors.white,
                  elevation: 8.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        padding: EdgeInsets.only(top: 20.0, left: 20.0),
                        alignment: Alignment.topLeft,
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          size: 28.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
