import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/pages/settings/view/settings_provider.dart';

class ChangePassordDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SettingsProvider>(context);
    return AlertDialog(
      title: Text('Change Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldCustem(
            label: 'Old Password',
            keyboardType: TextInputType.text,
            prefexIcon: Icons.lock_outline,
            obscureText: true,
            errorMessege:
                data.isOldPasswordValid ? null : 'enter Valid Passord',
            onChanged: (value) {
              data.onChangeOldPassword(value);
            },
            onSubmitted: (value) {
              data.oldPassowrdValidation(value);
            },
          ),
          TextFieldCustem(
            label: 'New Passowrd',
            keyboardType: TextInputType.text,
            prefexIcon: Icons.lock_outline,
            obscureText: true,
            errorMessege:
                data.isNewPasswordValid ? null : 'enter Valid Passord',
            onChanged: (value) {
              data.onChangeNewPassword(value);
            },
            onSubmitted: (value) {
              data.newPasswordValidation(value);
            },
          ),
          TextFieldCustem(
            label: 'Conferm Passord',
            keyboardType: TextInputType.text,
            prefexIcon: Icons.lock_outline,
            obscureText: true,
            errorMessege:
                data.isNewPasswordValid ? null : 'enter Valid Passord',
            onChanged: (value) {
              data.confermPasswordValidation(value);
            },
            onSubmitted: (value) {
              data.confermPasswordValidation(value);
            },
          ),
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () {
            data.submit(context);
          },
          child: Text(
            'Submit',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
