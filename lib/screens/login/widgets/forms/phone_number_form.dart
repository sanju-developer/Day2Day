import 'package:day2day/screens/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneNumberForm extends StatefulWidget {
  final Function(String) onPress;

  const PhoneNumberForm({Key key, @required this.onPress}) : super(key: key);

  @override
  _PhoneNumberFormState createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  final _formKey = GlobalKey<FormState>();
  final String phoneRegex = r'^[6789]\d{9}$$';
  final String _countryCode = '+91';
  TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  bool phoneNumberValidator(String value) {
    RegExp regex = new RegExp(phoneRegex);
    if (regex.hasMatch(value))
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 40.0,
          ),
          child: Text(
            'OTP Verification',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 28.0,
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'We will send you an ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'One Time Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(text: ' on this mobile number'),
            ],
          ),
        ),
        SizedBox(height: 30.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Form(
            key: _formKey,
            child: TextFormField(
              style: TextStyle(letterSpacing: 5),
              textAlignVertical: TextAlignVertical.center,
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_iphone),
                prefixText: _countryCode,
                labelText: "Mobile Number",
                counterText: "",
                contentPadding: EdgeInsets.symmetric(vertical: 0.0),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter phone no!';
                } else if (value.length < 10 || !phoneNumberValidator(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
        RaisedButton(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              String _phoneNumberWithCountryCode =
                  "$_countryCode${_phoneController.text}";
              FocusScope.of(context).unfocus();
              widget.onPress(_phoneNumberWithCountryCode);
              BlocProvider.of<LoginBloc>(context).add(
                PhoneNumberEntered(_phoneNumberWithCountryCode),
              );
            }
          },
          child: Text(
            "Get OTP".toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
