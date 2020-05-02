import 'package:flutter/material.dart';

import 'package:day2day/utils/phone_call.dart';
import 'package:day2day/widgets/account_chart/account_chart.dart';

class MyGroup extends StatefulWidget {
  @override
  _MyGroupState createState() => _MyGroupState();
}

class _MyGroupState extends State<MyGroup> {
  final _phoneCall = PhoneCall();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: 16.0, right: 16.0, bottom: 16.0, top: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30.0,
                  ),
                ),
                AccountChart(),
                Center(
                  child: Text(
                    'Investment per day',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Details :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Text(
                  '23 May 2020 Monday',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Delievered',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.done_all,
                      color: Colors.green,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.25,
              builder: (BuildContext context, myscrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(top: 5.0, right: 30.0, left: 30.0),
                        child: SingleChildScrollView(
                          controller: myscrollController,
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.maximize,
                                size: 42.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: FadeInImage(
                                        width: 90.0,
                                        height: 90.0,
                                        image: NetworkImage('null'),
                                        placeholder: NetworkImage(
                                            'http://via.placeholder.com/90x90/fff'),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.compare_arrows,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: FadeInImage(
                                        width: 90.0,
                                        height: 90.0,
                                        image: NetworkImage('null'),
                                        placeholder: NetworkImage(
                                            'http://via.placeholder.com/90x90/fff'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: myscrollController,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  width: 1.0,
                                ))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    if (index == 0)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'History :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30.0),
                                          ),
                                          PopupMenuButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15.0))),
                                            icon: Icon(Icons.filter_list),
                                            elevation: 8.0,
                                            offset: Offset(0, 100),
                                            color: Colors.white,
                                            onSelected: (result) {},
                                            itemBuilder:
                                                (BuildContext context) =>
                                                    <PopupMenuEntry>[
                                              PopupMenuItem(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      'Date',
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    IconButton(
                                                      onPressed: () => {},
                                                      icon: Icon(
                                                        Icons.arrow_upward,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      '23 May 2020 Monday',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Delievery Item'),
                                        Text('Water Bottle')
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Quantity'),
                                        Text(
                                          '2',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xffa05195)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Total Price'),
                                        Text(
                                          '30 ₹',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xffffa600)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Paid'),
                                        Text(
                                          'Done',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xff003f5c)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Not satisfied?'),
                                        IconButton(
                                          onPressed: () => _phoneCall
                                              .launchCall('+91 9999262312'),
                                          icon: Icon(
                                            Icons.call,
                                          ),
                                        ),
                                      ],
                                    ),
                                    RaisedButton(
                                      onPressed: () {},
                                      color: index % 2 == 0
                                          ? Color(0xff2f4b7c)
                                          : Colors.red,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            index % 2 == 0
                                                ? 'Delievered'
                                                : 'Not Delievered',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0),
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          index % 2 == 0
                                              ? Icon(
                                                  Icons.done_all,
                                                  color: Colors.white,
                                                  size: 18.0,
                                                )
                                              : Icon(Icons.clear,
                                                  color: Colors.white,
                                                  size: 18.0)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
