import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneCall {
  BuildContext context;

  Future<void> launchCall(String phone) async {
    final url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      return Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Uh oh! Something went wrong'),
        ),
      );
    }
  }
}
