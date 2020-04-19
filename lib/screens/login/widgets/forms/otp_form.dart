import 'dart:async';

import 'package:day2day/screens/login/bloc/login_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPForm extends StatefulWidget {
  final String phoneNumber;

  const OTPForm({Key key, @required this.phoneNumber}) : super(key: key);

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  TextEditingController _textEditingController;
  StreamController<ErrorAnimationType> _errorController;
  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    _errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 40.0,
          ),
          child: Text(
            'Phone Number Verification',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        RichText(
          text: TextSpan(
            text: "Enter the code sent to ",
            children: [
              TextSpan(
                text: widget.phoneNumber,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.0),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: PinCodeTextField(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textInputType: TextInputType.number,
            length: 6,
            inactiveFillColor: Theme.of(context).scaffoldBackgroundColor,
            selectedFillColor: Theme.of(context).scaffoldBackgroundColor,
            selectedColor: Theme.of(context).accentColor,
            obsecureText: false,
            animationType: AnimationType.slide,
            shape: PinCodeFieldShape.underline,
            inactiveColor: Theme.of(context).accentColor,
            animationDuration: Duration(milliseconds: 300),
            fieldHeight: 50,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            fieldWidth: 30,
            activeFillColor: Theme.of(context).scaffoldBackgroundColor,
            enableActiveFill: true,
            errorAnimationController: _errorController,
            controller: _textEditingController,
            onChanged: (value) {},
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "*Please fill up all the cells properly",
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
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    BlocProvider.of<LoginBloc>(context)
                        .add(ResendOTPPressed(widget.phoneNumber));
                  },
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
          child: ButtonTheme(
            height: 50,
            child: FlatButton(
              onPressed: () {
                String otpCode = _textEditingController.text;
                if (otpCode.length != 6) {
                  _errorController.add(
                    ErrorAnimationType.shake,
                  ); // Triggering error shake animation
                  setState(() {
                    hasError = true;
                  });
                } else {
                  setState(() {
                    hasError = false;
                    BlocProvider.of<LoginBloc>(context)
                        .add(OTPCodeEntered(otpCode));
                  });
                }
              },
              child: Center(
                child: Text(
                  "VERIFY",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
                _textEditingController.clear();
              },
            ),
          ],
        ),
      ],
    );
  }
}
