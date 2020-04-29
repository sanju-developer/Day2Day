import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:day2day/widgets/crousel/merchantlist_crousel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class MerchantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // The containers in the background
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50.0, left: 10.0, right: 20.0),
                height: MediaQuery.of(context).size.height,
                color: Theme.of(context).accentColor,
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
                            FlatButton(
                              onPressed: () => launch("tel:+91 9999262312"),
                              padding: EdgeInsets.all(0.0),
                              color: Theme.of(context).accentColor,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(Icons.call),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "+91 9999262312",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                top: MediaQuery.of(context).size.height * .50,
                right: 5.0,
                left: 5.0,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  color: Colors.white,
                  elevation: 8.0,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              alignment: Alignment.topLeft,
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.arrow_back,
                                size: 28.0,
                              ),
                            ),
                            PopupMenuButton(
                              icon: Icon(Icons.more_vert),
                              elevation: 8.0,
                              offset: Offset(0, 100),
                              color: Colors.white,
                              onSelected: (result) {},
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry>[
                                PopupMenuItem(
                                  height: 15.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Join',
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.check,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 7,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Joined Members:',
                          style: TextStyle(
                              color: Theme.of(context).buttonColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w800),
                        ),
                        Wrap(
                          spacing: 8.0,
                          children: List<Widget>.generate(
                            10,
                            (int index) {
                              return Chip(
                                elevation: 4.0,
                                avatar: CircleAvatar(
                                  backgroundColor: Colors.grey.shade800,
                                  child: Text('AB'),
                                ),
                                label: Text('Vivek Rajoriya'),
                              );
                            },
                          ).toList(),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Rating:',
                          style: TextStyle(
                              color: Theme.of(context).buttonColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w800),
                        ),
                        RatingBar(
                          initialRating: 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                            size: 1.0,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Other Groups:',
                                style: TextStyle(
                                    color: Theme.of(context).buttonColor,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w800),
                              ),
                              MerchantListCarousel(),
                            ],
                          ),
                        ),
                      ],
                    ),
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
