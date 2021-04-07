import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/pages/registry/models/registry_model.dart';
import 'package:weds360/pages/registry/view/registry_provider.dart';

class EditItemDialog extends StatelessWidget {
  final RegistryModel registryModel;

  EditItemDialog(this.registryModel);
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
            value: registryModel.title,
            prefexIcon: Icons.title_rounded,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              registryModel.title = value;
            },
          ),
          TextFieldCustem(
            label: 'Address',
            value: registryModel.address,
            prefexIcon: Icons.location_on_rounded,
            keyboardType: TextInputType.streetAddress,
            onChanged: (value) {
              registryModel.address = value;
            },
          ),
          TextFieldCustem(
            label: 'Note',
            value: registryModel.note,
            prefexIcon: Icons.note_add_outlined,
            keyboardType: TextInputType.multiline,
            onChanged: (value) {
              registryModel.note = value;
            },
          ),
          TextFieldCustem(
            label: 'Price',
            value: registryModel.price.toString(),
            prefexIcon: Icons.monetization_on_outlined,
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              registryModel.price = double.parse(value);
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
            data.edititem(context: context, registry: registryModel);
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
