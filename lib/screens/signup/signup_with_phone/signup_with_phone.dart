import 'package:day2day/screens/signup/signup_with_phone/otp_verification.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SignupWithPhone extends StatefulWidget {
  @override
  _SignupWithPhoneState createState() => _SignupWithPhoneState();
}

class _SignupWithPhoneState extends State<SignupWithPhone> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  bool isSignUpBtnClicked = false;
  String phone = '';

  bool signUpBtnClicked() {
    setState(() {
      isSignUpBtnClicked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 28.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Form(
                        key: _formKey,
                        child: Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              'lib/assets/images/login-yellow.svg',
                              semanticsLabel: 'Acme Logo',
                              width: 200,
                              height: 200,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                  top: 40.0,
                                ),
                                child: Text(
                                  'OTP Verification',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 28.0),
                                )),
                            Container(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'We will send you an ',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16.0),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'One Time Password',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    TextSpan(text: ' on this mobile number'),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 30.0, left: 40.0, right: 40.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Enter Mobile Number',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.0,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    style: TextStyle(letterSpacing: 5),
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    maxLength: 10,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: InputDecoration(
                                      counterText: "",
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 0.0),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        phone = value;
                                      });
                                      print(phone);
                                      print(_formKey);
                                      if (_formKey.currentState.validate()) {
                                        return null;
                                      }
                                    },
                                    validator: (value) {
                                      if (value.isEmpty && isSignUpBtnClicked) {
                                        return 'Please enter phone no!';
                                      } else if (value.length < 10 &&
                                          isSignUpBtnClicked) {
                                        return 'Please enter valid phone no!';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 30),
                      child: ButtonTheme(
                        height: 50,
                        child: FlatButton(
                          onPressed: () {
                            signUpBtnClicked();
                            if (_formKey.currentState.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OTPVerificationPage(
                                          '+91 999262312')));
                            }
                          },
                          child: Center(
                              child: Text(
                            "Get OTP".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
