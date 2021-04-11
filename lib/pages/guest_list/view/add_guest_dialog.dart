import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/pages/guest_list/view/guest_list_provider.dart';

class AddGuestDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<GuestListProvider>(context);
    return AlertDialog(
      title: Text('ADD new Guest'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldCustem(
            label: 'Name',
            prefexIcon: Icons.person,
            keyboardType: TextInputType.name,
            onChanged: (value) {
              data.onNameChanged(value);
            },
            onSubmitted: (value) {
              data.nameValdation(value);
            },
            errorMessege: data.isNameValid ? null : 'name not valied',
          ),
          TextFieldCustem(
            label: 'email',
            prefexIcon: Icons.email_rounded,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              data.onEmailChanged(value);
            },
            onSubmitted: (value) {
              data.emailValidation(value);
            },
            errorMessege: data.isEmailValid ? null : 'email is not valied',
          ),
          TextFieldCustem(
            label: 'phone',
            prefexIcon: Icons.phone,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              data.onPhoneChange(value);
            },
            onSubmitted: (value) {
              data.phoneValdation(value);
            },
            errorMessege: data.isPhoneValid ? null : 'phone not Valid',
          ),
          DropdownButton(
              value: data.selectedAge,
              items: [
                DropdownMenuItem(value: 'OLD', child: Text('OLD')),
                DropdownMenuItem(value: 'YOUNG', child: Text('YOUNG')),
              ],
              onChanged: (value) {
                data.onSelctedAge(value);
              })
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () {
            data.addNewGuest(context);
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
