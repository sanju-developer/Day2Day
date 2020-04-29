import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class PhoneCall {
  Future<void> launchCall(String phone) async {
    final url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
