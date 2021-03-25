import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:weds360/pages/login/view/forget_password/forget_password_provider.dart';

class ForgetpasswordDialog extends StatelessWidget {
  final String title;

  const ForgetpasswordDialog({@required this.title});

  @override
  Widget build(BuildContext context) {
    final forgetPassword = Provider.of<ForgetPasswordProvider>(context);
    return Platform.isAndroid
        ? AlertDialog(
            title: Text(title),
            content: TextFieldCustem(
              label: AppLocalizations.of(context)
                  .translate('email_Text_filied_Label'),
              prefexIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                forgetPassword.onChangedEmail(value);
              },
              onSubmitted: (value) {
                forgetPassword.emailValidation(value);
              },
              errorMessege: forgetPassword.isEmailValid
                  ? null
                  : AppLocalizations.of(context)
                      .translate('error_messege_Email'),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  forgetPassword.close(context);
                },
                child: Text(
                  AppLocalizations.of(context)
                      .translate('forget_password_close_Button'),
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  forgetPassword.submit(context);
                },
                child: Text(
                  AppLocalizations.of(context)
                      .translate('forgert_password_Button'),
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: Text(title),
            content: TextFieldCustem(
              label: 'email',
              prefexIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                forgetPassword.onChangedEmail(value);
              },
              onSubmitted: (value) {
                forgetPassword.emailValidation(value);
              },
              errorMessege: forgetPassword.isEmailValid
                  ? null
                  : AppLocalizations.of(context)
                      .translate('error_messege_Email'),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(AppLocalizations.of(context)
                    .translate('forget_password_close_Button')),
                onPressed: () {
                  forgetPassword.close(context);
                },
              ),
              CupertinoDialogAction(
                child: Text(AppLocalizations.of(context)
                    .translate('forgert_password_Button')),
                onPressed: () {
                  forgetPassword.submit(context);
                },
              ),
            ],
          );
  }
}
