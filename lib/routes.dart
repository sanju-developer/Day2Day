import 'package:day2day/screens/entry/entry.dart';
import 'package:day2day/screens/error/error.dart';
import 'package:day2day/screens/groups/groups.dart';
import 'package:day2day/screens/login/login.dart';
import 'package:day2day/screens/login/phone_login.dart';
import 'package:day2day/screens/my_group/my_group.dart';
import 'package:day2day/screens/notification/notification.dart';
import 'package:day2day/screens/profile/profile.dart';
import 'package:day2day/widgets/size_route/scale_route.dart';
import 'package:day2day/screens/merchant_page/merchant_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String EntryPageRoute = '/';
  static const String GroupsPageRoute = '/groups';
  static const String LoginPageRoute = '/login';
  static const String PhoneLoginPageRoute = '/phone-login';
  static const String NotificationPageRoute = '/notification';
  static const String ProfilePageRoute = '/profile';
  static const String MerchantPageRoute = '/merchantPage';
  static const String MyGroupPageRoute = '/myGroups';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case EntryPageRoute:
        return MaterialPageRoute(
          builder: (context) => EntryPage(),
        );

      case MyGroupPageRoute:
        return MaterialPageRoute(
          builder: (context) => MyGroup(),
        );

      case GroupsPageRoute:
        return MaterialPageRoute(
          builder: (context) => GroupsPage(),
        );

      case LoginPageRoute:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );

      case PhoneLoginPageRoute:
        return MaterialPageRoute(
          builder: (context) => PhoneLoginPage(),
        );

      case NotificationPageRoute:
        return ScaleRoute(page: NotificationPage());

      case ProfilePageRoute:
        return MaterialPageRoute(
          builder: (context) => ProfilePage(),
        );

      case MerchantPageRoute:
        return MaterialPageRoute(
          builder: (context) => MerchantPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => ErrorScreen(),
        );
    }
  }
}
