import 'package:day2day/screens/entry/entry.dart';
import 'package:day2day/screens/error/error.dart';
import 'package:day2day/screens/groups/groups.dart';
import 'package:day2day/screens/login/login.dart';
import 'package:day2day/screens/notification/notification.dart';
import 'package:day2day/screens/profile/profile.dart';
import 'package:day2day/screens/register/register.dart';
import 'package:day2day/screens/signup/signup_with_phone/otp_verification.dart';
import 'package:day2day/screens/signup/signup_with_phone/signup_with_phone.dart';
import 'package:day2day/widgets/size_route/size_route.dart';
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
    switch (settings.name) {
      case EntryPageRoute:
        return MaterialPageRoute(
          builder: (context) => EntryPage(),
        );

      case GroupsPageRoute:
        return MaterialPageRoute(
          builder: (context) => GroupsPage(),
        );

      case LoginPageRoute:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );

      case NotificationPageRoute:
        return SizeRoute(page: NotificationPage());

      case ProfilePageRoute:
        return MaterialPageRoute(
          builder: (context) => ProfilePage(),
        );

      case RegisterPageRoute:
        return MaterialPageRoute(
          builder: (context) => RegisterPage(),
        );

      case SignupWithPhoneRoute:
        return MaterialPageRoute(
          builder: (context) => SignupWithPhone(),
        );

      case OTPVerificationPageRoute:
        OTPVerificationPageArguments args = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => OTPVerificationPage(args.phoneNumber),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => ErrorScreen(),
        );
    }
  }
}
