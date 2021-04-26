import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weds360/components/text_field_custem.dart';

class EditDialog extends StatelessWidget {
  final String label;
  final Function onPressed;
  final IconData icon;
  final TextInputType keyboard;
  final Function onChanded;
  final Function onSubmeted;
  final String errorMassege;
  final bool isBirthday;
  EditDialog({
    @required this.label,
    @required this.onPressed,
    @required this.icon,
    @required this.keyboard,
    @required this.onSubmeted,
    @required this.onChanded,
    @required this.errorMassege,
    this.isBirthday = false,
  });
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? AlertDialog(
            title: Text(label),
            content: TextFieldCustem(
              label: label,
              prefexIcon: icon,
              keyboardType: keyboard,
              onChanged: onChanded,
              onSubmitted: onSubmeted,
              errorMessege: errorMassege,
              isBirthDay: isBirthday,
            ),
            actions: [
              FlatButton(
                onPressed: onPressed,
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: Text(label),
            content: TextFieldCustem(
              label: label,
              keyboardType: TextInputType.text,
              onChanged: onChanded,
              onSubmitted: onSubmeted,
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('Submit'),
                onPressed: onPressed,
              ),
            ],
          );
  }
}
