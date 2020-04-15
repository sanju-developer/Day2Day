import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  bool showLoader = false;
  bool isSignUpBtnClicked = false;
  bool lockIcon = true;
  String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String username = '';
  String phone = '';
  String email = '';
  String password = '';
  String rePassword = '';

  bool signUpBtnClicked() {
    setState(() {
      isSignUpBtnClicked = true;
    });
    return showLoader;
  }

  bool showLoaderOnLogin() {
    setState(() {
      showLoader = true;
    });
    return showLoader;
  }

  bool toggleLockButton() {
    setState(() {
      lockIcon = !lockIcon;
    });
    return lockIcon;
  }

  bool validateEmail(String value) {
    RegExp regex = new RegExp(emailPattern);
    if (!regex.hasMatch(value))
      return true;
    else
      return false;
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // username form field
          TextFormField(
            keyboardType: TextInputType.text,
            maxLength: 32,
            readOnly: showLoader,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                labelText: 'Please enter username',
                counterText: "",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                )),
            onChanged: (value) {
              if (_formKey.currentState.validate()) {
                return null;
              }
              setState(() {
                username = value;
              });
            },
            validator: (value) {
              if (value.isEmpty && isSignUpBtnClicked) {
                return 'Please enter username!';
              } else if (value.length < 3 && isSignUpBtnClicked) {
                return 'Please enter minimum 3 words username!';
              }
              return null;
            },
          ),
          SizedBox(height: 18),
          // email
          TextFormField(
            initialValue: '+91',
            keyboardType: TextInputType.emailAddress,
            maxLength: 50,
            readOnly: showLoader,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                labelText: 'Please enter email',
                counterText: "",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                )),
            onChanged: (value) {
              if (_formKey.currentState.validate()) {
                return null;
              }
              setState(() {
                email = value;
              });
            },
            validator: (value) {
              if (value.isEmpty && isSignUpBtnClicked) {
                return 'Please enter email!';
              } else if (validateEmail(value) && isSignUpBtnClicked) {
                return 'Please enter valid email!';
              } else
                return null;
            },
          ),
          SizedBox(height: 18),
          // phone
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            readOnly: showLoader,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                labelText: 'Please enter phone no.',
                counterText: "",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                )),
            onChanged: (value) {
              setState(() {
                phone = value;
              });
              if (_formKey.currentState.validate()) {
                return null;
              }
            },
            validator: (value) {
              if (value.isEmpty && isSignUpBtnClicked) {
                return 'Please enter phone no!';
              } else if (value.length < 10 && isSignUpBtnClicked) {
                return 'Please enter valid phone no!';
              }
              return null;
            },
          ),
          SizedBox(height: 18), // for spacing b/w two input fields
          // password form field
          TextFormField(
            obscureText: !lockIcon,
            readOnly: showLoader,
            maxLength: 8,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                counterText: "",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                labelText: 'Please enter password',
                suffixIcon: password.length > 0
                    ? IconButton(
                        icon: lockIcon
                            ? Icon(
                                Icons.lock_open,
                                color: Theme.of(context).primaryColor,
                              )
                            : Icon(
                                Icons.lock_outline,
                                color: Theme.of(context).primaryColor,
                              ),
                        onPressed: () {
                          toggleLockButton();
                        },
                      )
                    : null,
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                )),
            validator: (value) {
              if (value.isEmpty && isSignUpBtnClicked) {
                return 'Please enter password!';
              } else if (value.length < 8 && isSignUpBtnClicked) {
                return 'Please enter atleast 8 digit password';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                password = value;
              });
              if (_formKey.currentState.validate()) {
                return null;
              }
            },
          ),
          SizedBox(height: 18),
          // re-password
          TextFormField(
            initialValue: password,
            obscureText: !lockIcon,
            readOnly: showLoader,
            maxLength: 8,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                counterText: "",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                labelText: 'Please re-enter password',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                )),
            validator: (value) {
              if (password != rePassword && isSignUpBtnClicked) {
                return 'Password not matched';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                rePassword = value;
              });
              if (_formKey.currentState.validate()) {
                return null;
              }
            },
          ),
          SizedBox(height: 20),
          // login button
          RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
              ),
              elevation: 12.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                signUpBtnClicked();
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  showLoaderOnLogin();
                }
              },
              padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
              child: !showLoader
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Sign up',
                          style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 22.0),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 28.0,
                          color: Theme.of(context).primaryColorLight,
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                            semanticsLabel: 'loginLoader',
                            semanticsValue: 'Validating...',
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColorLight)),
                      ],
                    )),
        ],
      ),
    );
  }
}
