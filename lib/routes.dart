import 'package:day2day/screens/entry/entry.dart';
import 'package:day2day/screens/groups/groups.dart';
import 'package:day2day/screens/login/login.dart';
import 'package:day2day/screens/notification/notification.dart';
import 'package:day2day/screens/profile/profile.dart';
import 'package:day2day/screens/register/register.dart';
import 'package:day2day/screens/signup/signup_with_phone/otp_verification.dart';
import 'package:day2day/screens/signup/signup_with_phone/signup_with_phone.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  Widget screenToRender;
  switch (settings.name) {
    case EntryPage.routeName:
      screenToRender = EntryPage();
      break;
    case GroupsPage.routeName:
      screenToRender = GroupsPage();
      break;
    case LoginPage.routeName:
      screenToRender = LoginPage();
      break;
    case NotificationPage.routeName:
      screenToRender = NotificationPage();
      break;
    case ProfilePage.routeName:
      screenToRender = ProfilePage();
      break;
    case RegisterPage.routeName:
      screenToRender = RegisterPage();
      break;
    case SignupWithPhone.routeName:
      screenToRender = SignupWithPhone();
      break;
    case OTPVerificationPage.routeName:
      OTPVerificationPageArguments args = settings.arguments;
      screenToRender = OTPVerificationPage(args.phoneNumber);
      break;
    default:
      screenToRender = ErrorScreen();
  }

  return MaterialPageRoute(
    builder: (context) => screenToRender,
  );
}

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  }
}
