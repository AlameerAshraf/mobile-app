import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/main.dart';
import 'package:weds360/pages/edit_profile/view/edit_profile_screen.dart';
import 'package:weds360/pages/settings/view/change_password_dialog.dart';
import 'package:weds360/pages/wedding_detales/view/wedding_detales_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'Settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  GlobalKey _keyRed = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      padding: EdgeInsets.all(kPADDING * 2),
      children: [
        Text(
          'Settings',
          style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 35.0,
                color: Theme.of(context).primaryColor,
              ),
        ),
        SizedBox(
          height: 20.0,
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            CupertinoIcons.person,
            size: 30.0,
            color: Colors.black,
          ),
          title: Align(
            alignment: Alignment(-1.2, 0),
            child: Text(
              'Account',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, EditProfileScreen.id);
          },
          child: Padding(
            padding: const EdgeInsets.all(kPADDING),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Edit Profile',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => ChangePassordDialog(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(kPADDING),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change Password',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, WeddingDetalesScreen.id);
          },
          child: Padding(
            padding: const EdgeInsets.all(kPADDING),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wedding Details',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            CupertinoIcons.app_badge,
            size: 30.0,
            color: Colors.black,
          ),
          title: Align(
            alignment: Alignment(-1.15, 0),
            child: Text(
              'More',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: () {
            final RenderBox renderBox =
                _keyRed.currentContext.findRenderObject();

            showMenu(
                context: context,
                position: RelativeRect.fromRect(
                  renderBox.localToGlobal(
                          Offset(MediaQuery.of(context).size.width - 120, 0)) &
                      Size(40, 40),
                  Offset.zero & renderBox.size,
                ),
                items: [
                  PopupMenuItem(
                    child: InkWell(
                        onTap: () {
                          MyApp.setLocal(context, Locale('en', ''));
                        },
                        child: Text('English')),
                  ),
                  PopupMenuItem(
                    child: InkWell(
                        onTap: () {
                          MyApp.setLocal(context, Locale('ar', ''));
                        },
                        child: Text('arabic')),
                  ),
                ]);
          },
          child: Padding(
            key: _keyRed,
            padding: const EdgeInsets.all(kPADDING),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(kPADDING),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Terms and Policy',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Logout',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
