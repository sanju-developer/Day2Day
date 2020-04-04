import 'package:day2day/screens/Groups/Groups.dart';

import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String password = '';
  bool lockIcon = false;
  bool showLoader = false;
  bool isLoginBtnClicked = false;

  bool toggleLockButton() {
    setState(() {
      lockIcon = !lockIcon;
    });

    return lockIcon;
  }

  bool showLoaderOnLogin() {
    setState(() {
      showLoader = true;
    });
    return showLoader;
  }

  bool loginBtnClicked() {
    setState(() {
      isLoginBtnClicked = true;
    });
    return isLoginBtnClicked;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
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
              },
              validator: (value) {
                if (value.isEmpty && isLoginBtnClicked) {
                  return 'Please enter username!';
                } else if (value.length < 3 && isLoginBtnClicked) {
                  return 'Please enter minimum 3 words username!';
                }
                return null;
              },
            ),
            SizedBox(height: 12), // for spacing b/w two input fields
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
                if (value.isEmpty && isLoginBtnClicked) {
                  return 'Please enter password!';
                } else if (value.length < 8 && isLoginBtnClicked) {
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
            SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('forgot password',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12.0)),
                    Icon(
                      Icons.help_outline,
                      color: Theme.of(context).primaryColor,
                      size: 18.0,
                    )
                  ],
                )),
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
                  loginBtnClicked();
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                    // showLoaderOnLogin();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GroupsPage()),
                    );
                  }
                },
                padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                child: !showLoader
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Sign in',
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
      ),
    );
  }
}
