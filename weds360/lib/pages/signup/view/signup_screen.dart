import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('signup_screen_label'),
        ),
        centerTitle: true,
      ),
    );
  }
}
