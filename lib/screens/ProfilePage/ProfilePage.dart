import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            elevation: 8.0,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            pinned: true,
            floating: false,
            expandedHeight: 250.0,
            backgroundColor: Color.fromRGBO(247, 246, 243, 1.0),
            flexibleSpace: FlexibleSpaceBar(
                title: Text('Vivek Rajoriya',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                // background: Image.network(
                //   'https://i.stack.imgur.com/UGgWD.png',
                //   fit: BoxFit.cover,
                // ),
                background: Image.asset(
                  'lib/assets/images/profilePic.svg',
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ))),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Color.fromRGBO(247, 246, 243, 1.0),
                child: Text('List Item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}
