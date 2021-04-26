import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/pages/registry/view/registry_provider.dart';

class AddItemDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<RegistryProvider>(context);
    return AlertDialog(
      title: Text('ADD ITEM'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldCustem(
            label: 'Title',
            prefexIcon: Icons.title_rounded,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              data.onChangeTitle(value);
            },
          ),
          TextFieldCustem(
            label: 'Address',
            prefexIcon: Icons.location_on_rounded,
            keyboardType: TextInputType.streetAddress,
            onChanged: (value) {
              data.onChangeAddress(value);
            },
          ),
          TextFieldCustem(
            label: 'Note',
            prefexIcon: Icons.note_add_outlined,
            keyboardType: TextInputType.multiline,
            onChanged: (value) {
              data.onChangeNote(value);
            },
          ),
          TextFieldCustem(
            label: 'Price',
            prefexIcon: Icons.monetization_on_outlined,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              data.onChangeprice(value);
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: FlatButton.icon(
              onPressed: () {
                data.getImage();
              },
              icon: Icon(
                Icons.image,
                size: 20.0,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              label: Text(
                'chosse Image',
                style: Theme.of(context).textTheme.button.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 15.0),
              ),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () {
            data.addItem(context);
          },
          child: Text(
            'Submet',
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
