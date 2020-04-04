import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: 300,
      child: Text(
          'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire.',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700)),
    );
  }
}
