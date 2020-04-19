import 'package:day2day/blocs/authentication/authentication_bloc.dart';
import 'package:day2day/screens/login/bloc/login_bloc.dart';
import 'package:day2day/screens/login/widgets/forms/otp_form.dart';
import 'package:day2day/screens/login/widgets/forms/phone_number_form.dart';
import 'package:day2day/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

class PhoneLoginPage extends StatefulWidget {
  @override
  _PhoneLoginPageState createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  bool otpRequested = false;
  String phoneNumber = '';

  void onPressGetOTP(String phoneNumber) {
    setState(() {
      otpRequested = true;
      this.phoneNumber = phoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
        ),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is OTPSentSuccess) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Enter the OTP"),
                ),
              );
            }
            if (state is OTPReSentSuccess) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("OTP Resent successfully"),
                ),
              );
            }
            if (state is LoginFailure) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Uh Oh! Something went wrong"),
                ),
              );
            }
            if (state is LoginSuccess) {
              Navigator.pop(context);
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                SizedBox(height: 80.0),
                SvgPicture.asset(
                  'lib/assets/images/login-yellow.svg',
                  semanticsLabel: 'Acme Logo',
                  width: 250,
                  height: 200,
                ),
                AnimatedCrossFade(
                  firstChild: PhoneNumberForm(
                    onPress: onPressGetOTP,
                  ),
                  secondChild: OTPForm(
                    phoneNumber: phoneNumber,
                  ),
                  crossFadeState: otpRequested
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: Duration(seconds: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
