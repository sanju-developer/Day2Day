import 'package:day2day/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationPageArguments {
  final String phoneNumber;

  OTPVerificationPageArguments(this.phoneNumber);
}

class OTPVerificationPage extends StatefulWidget {
  static const String routeName = '/otpVerification';
  final String phoneNumber;
  OTPVerificationPage(this.phoneNumber);
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  TapGestureRecognizer onTapRecognizer;

  final TextEditingController textEditingController = TextEditingController()
    ..text = "";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              IconButton(
                  padding: EdgeInsets.only(left: 15.0),
                  alignment: Alignment.topLeft,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 28.0,
                  )),
              Container(
                child: SvgPicture.asset(
                  'lib/assets/images/msg-sent.svg',
                  semanticsLabel: 'Acme Logo',
                  width: 200,
                  height: 150,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Phone Number Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Enter the code sent to ",
                      children: [
                        TextSpan(
                          text: widget.phoneNumber,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                      style: TextStyle(color: Colors.black54, fontSize: 15)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    length: 6,
                    inactiveFillColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    selectedFillColor:
                        Theme.of(context).scaffoldBackgroundColor,
                    selectedColor: Theme.of(context).accentColor,
                    obsecureText: false,
                    animationType: AnimationType.slide,
                    shape: PinCodeFieldShape.underline,
                    inactiveColor: Theme.of(context).accentColor,
                    animationDuration: Duration(milliseconds: 300),
                    fieldHeight: 50,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    fieldWidth: 40,
                    activeFillColor: Theme.of(context).scaffoldBackgroundColor,
                    enableActiveFill: true,
                    autoFocus: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    onCompleted: (v) {},
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: TextStyle(color: Colors.red.shade300, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                    children: [
                      TextSpan(
                        text: " RESEND",
                        recognizer: onTapRecognizer,
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ]),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: ButtonTheme(
                  height: 50,
                  child: FlatButton(
                    onPressed: () {
                      // conditions for validating
                      print(currentText);
                      if (currentText.length != 6) {
                        errorController.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() {
                          hasError = true;
                        });
                      } else {
                        setState(() {
                          hasError = false;
                          scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text("Aye!!"),
                            duration: Duration(seconds: 2),
                          ));
                        });
                        Navigator.pushNamed(context, Routes.GroupsPageRoute);
                      }
                    },
                    child: Center(
                        child: Text(
                      "VERIFY",
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
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text("Clear"),
                    onPressed: () {
                      textEditingController.clear();
                    },
                  ),
                  // FlatButton(
                  //   child: Text("Set Text"),
                  //   onPressed: () {
                  //     textEditingController.text = "";
                  //   },
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
