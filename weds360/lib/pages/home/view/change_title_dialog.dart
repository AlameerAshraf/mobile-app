import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:weds360/pages/home/view/home_provider.dart';

class ChageTitleDialog extends StatelessWidget {
  final String title;
  final int index;

   ChageTitleDialog({
    @required this.title,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final homedata = Provider.of<HomeProvider>(context);
    String titlenew;
    return Platform.isAndroid
        ? AlertDialog(
            title: Text(title),
            content: TextFieldCustem(

                label: 'title',
                prefexIcon: Icons.check_box_outlined,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  print(value);
                  homedata.newLabel =value;
                },
                onSubmitted: (value) {
                  titlenew = value;
                  homedata.onLabelChangeCheckList(index, titlenew);
                  Navigator.of(context, rootNavigator: true).pop();
                }),
            actions: [
              FlatButton(
                onPressed: () {
                  homedata.onLabelChangeCheckList(index, homedata.newLabel);
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
            title: Text(title),
            content: TextFieldCustem(
              label: 'title',
              keyboardType: TextInputType.text,
              onChanged: (value) {
                titlenew = value;
              },
              onSubmitted: (value) {
                homedata.onLabelChangeCheckList(index, titlenew);
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(AppLocalizations.of(context)
                    .translate('forget_password_close_Button')),
                onPressed: () {
                  homedata.onLabelChangeCheckList(index, titlenew);
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          );
  }
}
