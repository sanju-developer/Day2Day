import 'package:day2day/routes.dart';
import 'package:day2day/screens/groups/widgets/group_page_topbar.dart';
import 'package:day2day/screens/groups/widgets/join_group_btn.dart';
import 'package:day2day/widgets/drawer/drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slimy_card/slimy_card.dart';

class GroupsPage extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedDrawer(
      child: Scaffold(
        appBar: GroupPageTopbar(),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       RaisedButton(
        //         onPressed: () {
        //           Navigator.pushNamed(context, Routes.MyGroupPageRoute);
        //         },
        //         child: Text('Goto my group details'),
        //       ),
        //       SvgPicture.asset(
        //         'lib/assets/images/no-group.svg',
        //         semanticsLabel: 'Acme Logo',
        //         width: 250,
        //         height: 200,
        //       ),
        //       Container(
        //           padding: EdgeInsets.only(top: 20.0),
        //           child: ModalBottomSheetDemo())
        //     ],
        //   ),
        // ),
        body: Container(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Your Groups',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: Colors.white),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: FadeInImage(
                        width: 50.0,
                        height: 50.0,
                        image: NetworkImage('null'),
                        placeholder: NetworkImage(
                            'http://via.placeholder.com/50x50/fff'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: SlimyCard(
                        color: index % 2 == 0
                            ? Color.fromRGBO(249, 93, 106, 0.3)
                            : Color.fromRGBO(47, 75, 124, 0.3),
                        width: MediaQuery.of(context).size.width,
                        topCardHeight: 260,
                        bottomCardHeight: 150,
                        borderRadius: 15,
                        topCardWidget: MyWidget1(index),
                        bottomCardWidget: MyWidget2(),
                        slimeEnabled: true,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget1 extends StatelessWidget {
  final index;
  MyWidget1(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Milk Booth ',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.verified_user,
                color: index % 2 == 0
                    ? Color.fromRGBO(249, 93, 106, 1)
                    : Color.fromRGBO(47, 75, 124, 1),
              )
            ],
          ),
          Text(
            'Vivek Rajoriya',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '+91 9999262312',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            '2310 Jawahar colony NIT Faridbad, Air force Road, Near Janmeda nursing home ',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                elevation: 14.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white),
                ),
                color: index % 2 == 0
                    ? Color.fromRGBO(249, 93, 106, 1)
                    : Color.fromRGBO(47, 75, 124, 1),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.MyGroupPageRoute);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'History',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    Icon(Icons.call_made, color: Colors.white)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'Today Status:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Text('23 May 2020, Sunday',
                style: TextStyle(
                    color: Color(0xff2f4b7c), fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              'Delievered',
              style: TextStyle(
                  color: Color(0xff2f4b7c), fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10.0),
            Icon(Icons.done_all, color: Color(0xff2f4b7c))
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              'Total Price',
              style: TextStyle(
                  color: Color(0xff2f4b7c), fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10.0),
            Text(
              '₹ 45',
              style: TextStyle(
                  color: Color(0xff2f4b7c), fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}
