import 'package:day2day/screens/entry/entry.dart';
import 'package:day2day/screens/groups/groups.dart';
import 'package:day2day/screens/login/login.dart';
import 'package:day2day/screens/notification/notification.dart';
import 'package:day2day/screens/profile/profile.dart';
import 'package:day2day/screens/register/register.dart';
import 'package:day2day/screens/signup/signup_with_phone/otp_verification.dart';
import 'package:day2day/screens/signup/signup_with_phone/signup_with_phone.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String EntryPageRoute = '/';
  static const String GroupsPageRoute = '/groups';
  static const String LoginPageRoute = '/login';
  static const String NotificationPageRoute = '/notification';
  static const String ProfilePageRoute = '/profile';
  static const String RegisterPageRoute = '/register';
  static const String SignupWithPhoneRoute = '/signupPhone';
  static const String OTPVerificationPageRoute = '/otpVerification';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget screenToRender;
    switch (settings.name) {
      case EntryPageRoute:
        screenToRender = EntryPage();
        break;
      case GroupsPageRoute:
        screenToRender = GroupsPage();
        break;
      case LoginPageRoute:
        screenToRender = LoginPage();
        break;
      case NotificationPageRoute:
        screenToRender = NotificationPage();
        break;
      case ProfilePageRoute:
        screenToRender = ProfilePage();
        break;
      case RegisterPageRoute:
        screenToRender = RegisterPage();
        break;
      case SignupWithPhoneRoute:
        screenToRender = SignupWithPhone();
        break;
      case OTPVerificationPageRoute:
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
