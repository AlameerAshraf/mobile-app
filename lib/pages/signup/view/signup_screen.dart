import 'package:flutter/material.dart';
import 'package:weds360/components/raised_button_costem.dart';
import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/core/helpers/app_localizations.dart';


class SignUpScreen extends StatefulWidget {
  static const String id = 'Signup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kPADDING * 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 25,
                // ),
                Text(
                  AppLocalizations.of(context).translate('signup_screen_label'),
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
                //   height: MediaQuery.of(context).size.height / 25,
                // ),
                TextFieldCustem(
                  label: 'Name',
                  prefexIcon: Icons.person,
                  keyboardType: TextInputType.name,
                ),
                TextFieldCustem(
                  label: 'Partner Name',
                  prefexIcon: Icons.person,
                  keyboardType: TextInputType.name,
                ),
                TextFieldCustem(
                  label: 'Email',
                  prefexIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFieldCustem(
                  label: 'Password',
                  prefexIcon: Icons.lock_outline,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                TextFieldCustem(
                  label: 'Confirm Password',
                  prefexIcon: Icons.lock_outline,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: kPADDING),
                  child: RaisedButtonCustem(
                    title: 'Signup',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
