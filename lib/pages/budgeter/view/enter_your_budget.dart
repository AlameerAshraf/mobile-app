import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:weds360/pages/budgeter/view/budgeter_provider.dart';

class EnterYourBudget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<BudgeterProvider>(context);
    return Platform.isAndroid
        ? AlertDialog(
            title: Text('Budget'),
            content: TextFieldCustem(
                label: 'Budget',
                prefexIcon: Icons.check_box_outlined,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  print(value);

                  data.onChangeBudget(value);
                },
                errorMessege: data.isValide ? null : 'enter Budget',
                onSubmitted: (_) {
                  data.onSubmetBudget();
                  Navigator.of(context, rootNavigator: true).pop();
                }),
            actions: [
              FlatButton(
                onPressed: () {
                  data.onSubmetBudget();
                  Navigator.of(context, rootNavigator: true).pop();
                },
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
            title: Text('Budget'),
            content: TextFieldCustem(
              label: 'Budget',
              keyboardType: TextInputType.text,
              onChanged: (value) {
                // titlenew = value;
              },
              onSubmitted: (value) {
                // homedata.onLabelChangeCheckList(index, titlenew);
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(AppLocalizations.of(context)
                    .translate('forget_password_close_Button')),
                onPressed: () {
                  // homedata.onLabelChangeCheckList(index, titlenew);
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          );
  }
}
