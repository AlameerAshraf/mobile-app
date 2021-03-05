import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/raised_button_costem.dart';
import 'package:weds360/components/rounded_icon_button.dart';
import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
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
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kPADDING),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                Text(
                  AppLocalizations.of(context).translate('login_screen_label'),
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 8),
                TextFieldCustem(
                  label: AppLocalizations.of(context)
                      .translate('email_Text_filied_Label'),
                  keyboardType: TextInputType.emailAddress,
                  prefexIcon: Icons.email,
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
                  prefexIcon: Icons.lock,
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
                      style: Theme.of(context).textTheme.overline,
                    ),
                  ),
                ),
                RaisedButtonCustem(
                  title: AppLocalizations.of(context).translate('login_Button'),
                  onPressed: () {
                    loginData.login(context);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedIconButton(
                      icon: BrandIcons.facebook,
                      onPressed: () {
                        loginData.loginWithFacebook(context);
                      },
                    ),
                    RoundedIconButton(
                      icon: Platform.isAndroid
                          ? BrandIcons.google
                          : BrandIcons.apple,
                      onPressed: () {
                        loginData.loginWithGoogle(context);
                      },
                    ),
                  ],
                ),
                Center(
                  child: FlatButton(
                    onPressed: () {
                      loginData.signup(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('create_account_Button'),
                      style: Theme.of(context).textTheme.overline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
