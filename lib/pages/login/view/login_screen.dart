import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/raised_button_costem.dart';
import 'package:weds360/components/rounded_icon_button.dart';
import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weds360/pages/login/view/forget_password/forget_password_dialog.dart';

import 'dart:io' show Platform;

import 'package:weds360/pages/login/view/login_provider.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'Login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginData = Provider.of<LoginProviedr>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kPADDING * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 11,
              // ),
              Text(
                AppLocalizations.of(context).translate('login_screen_label'),
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: 35.0,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              Text(
                'Wedding Planning is a piece of cake with Weds360 .',
                // AppLocalizations.of(context).translate('login_screen_label'),
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w600,
                      // fontSize: 35.0,
                      color: Theme.of(context).accentColor.withOpacity(0.6),
                    ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 11,
              // ),
              TextFieldCustem(
                label: AppLocalizations.of(context)
                    .translate('email_Text_filied_Label'),
                keyboardType: TextInputType.emailAddress,
                prefexIcon: Icons.email_outlined,
                errorMessege: loginData.isEmailValid
                    ? null
                    : AppLocalizations.of(context)
                        .translate('error_messege_Email'),
                onChanged: (value) {
                  loginData.onChangedEmail(value);
                },
                onSubmitted: (value) {
                  loginData.emailValidation(value);
                },
              ),
              TextFieldCustem(
                label: AppLocalizations.of(context)
                    .translate('password_Text_filied_Label'),
                keyboardType: TextInputType.text,
                prefexIcon: Icons.lock_outline,
                obscureText: true,
                errorMessege: loginData.isPasswordValid
                    ? null
                    : AppLocalizations.of(context)
                        .translate('error_messege_Password'),
                onChanged: (value) {
                  loginData.onChangedPassword(value);
                },
                onSubmitted: (value) {
                  loginData.passwordValidation(value);
                },
              ),
              Center(
                child: FlatButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => ForgetpasswordDialog(
                        title: AppLocalizations.of(context)
                            .translate('forget_passwrod_Button'),
                      ),
                      barrierDismissible: false,
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('forget_passwrod_Button'),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
              RaisedButtonCustem(
                title: AppLocalizations.of(context).translate('login_Button'),
                onPressed: () {
                  loginData.login(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedIconButton(
                      color: Color(0xFF3b5998),
                      icon: FontAwesomeIcons.facebookF,
                      onPressed: () {
                        loginData.loginWithFacebook(context);
                      },
                    ),
                    RoundedIconButton(
                      color: Platform.isAndroid
                          ? Color(0xFFDB4437)
                          : Color(0xFF555555),
                      icon: Platform.isAndroid
                          ? FontAwesomeIcons.google
                          : FontAwesomeIcons.apple,
                      onPressed: () {
                        loginData.loginWithGoogle(context);
                      },
                    ),
                    RoundedIconButton(
                      icon: FontAwesomeIcons.twitter,
                      color: Color(0xFF1DA1F2),
                      onPressed: () {
                        loginData.loginWithGoogle(context);
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'OR',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)
                        .translate('Dont_have_an_account'),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      loginData.signup(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('create_account_Button'),
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
