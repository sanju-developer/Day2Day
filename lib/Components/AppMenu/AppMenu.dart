import 'package:flutter/material.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<WhyFarther>(
      elevation: 10.0,
      onSelected: (WhyFarther result) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.harder,
          child: Text('Working a lot harder'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.smarter,
          child: Text('Being a lot smarter'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.selfStarter,
          child: Text('Being a self-starter'),
        ),
        const PopupMenuItem<WhyFarther>(
          value: WhyFarther.tradingCharter,
          child: Text('Placed in charge of trading charter'),
        ),
      ],
    );
  }
}
