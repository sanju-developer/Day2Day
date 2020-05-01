import 'package:day2day/widgets/account_chart/account_chart.dart';
import 'package:flutter/material.dart';

class MyGroup extends StatefulWidget {
  @override
  _MyGroupState createState() => _MyGroupState();
}

class _MyGroupState extends State<MyGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
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
                          color: Colors.green, fontWeight: FontWeight.bold),
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
                          padding: EdgeInsets.only(
                              top: 30.0, right: 30.0, left: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: FadeInImage(
                                    width: 75.0,
                                    height: 75.0,
                                    image: NetworkImage('null'),
                                    placeholder: NetworkImage(
                                        'http://via.placeholder.com/75x75'),
                                  )),
                              Icon(
                                Icons.compare_arrows,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: FadeInImage(
                                    image: NetworkImage('null'),
                                    placeholder: NetworkImage(
                                        'http://via.placeholder.com/75x75'),
                                  ))
                            ],
                          )),
                      Expanded(
                        child: ListView.builder(
                          controller: myscrollController,
                          itemCount: 25,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Text(
                              'Dish $index',
                              style: TextStyle(color: Colors.black54),
                            ));
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
