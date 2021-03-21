import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:weds360/components/drawer_heading_view.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/blog/view/blog_screen.dart';
import 'package:weds360/pages/categorys/view/categorys_screen.dart';
import 'package:weds360/pages/drawer/view/drawer_list_tile.dart';
import 'package:weds360/pages/home/view/home_provider.dart';
import 'package:weds360/pages/home/view/home_screen.dart';
import 'package:weds360/pages/login/view/login_screen.dart';
import 'package:weds360/pages/messeges/view/messeges_screen.dart';
import 'package:weds360/pages/profile/view/profile_screen.dart';
import 'package:weds360/pages/settings/view/settings_screen.dart';

class DrawerScreen extends StatefulWidget {
  static const String id = 'Drawer';
  final AnimationController controller;
  DrawerScreen({this.controller});
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String isSelcted = HomeScreen.id;
  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(kPADDING),
            child: ListView(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: kPADDING * 2 + 5),
                  child: DrawerHeadingView(
                    email: 'amotie@outlook.com',
                    name: 'Ali & Nada',
                  ),
                ),
                SizedBox(
                  height: kPADDING,
                ),
                Divider(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  indent: 30.0,
                  endIndent: 160.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
                DrawerListTile(
                  icon: Icons.home_rounded,
                  title: 'Home',
                  isSelceted: isSelcted == HomeScreen.id ? true : false,
                  onPressed: () {
                    setState(() {
                      widget.controller.reverse();
                      isSelcted = HomeScreen.id;
                      homeData.changePage(isSelcted);
                    });
                  },
                ),
                SizedBox(
                  height: kPADDING,
                ),
                DrawerListTile(
                  icon: Icons.person,
                  title: 'Profile',
                  isSelceted: isSelcted == ProfileScreen.id ? true : false,
                  onPressed: () {
                    setState(() {
                      widget.controller.reverse();
                      isSelcted = ProfileScreen.id;
                      homeData.changePage(isSelcted);
                    });
                  },
                ),
                SizedBox(
                  height: kPADDING,
                ),
                DrawerListTile(
                  icon: FontAwesomeIcons.blogger,
                  title: 'Blogs',
                  isSelceted: isSelcted == BlogScreen.id ? true : false,
                  onPressed: () {
                    setState(() {
                      widget.controller.reverse();
                      isSelcted = BlogScreen.id;
                      homeData.changePage(isSelcted);
                      homeData.changePage(isSelcted);
                    });
                  },
                ),
                SizedBox(
                  height: kPADDING,
                ),
                DrawerListTile(
                  icon: Icons.settings,
                  title: 'Settings',
                  isSelceted: isSelcted == SettingsScreen.id ? true : false,
                  onPressed: () {
                    setState(() {
                      widget.controller.reverse();
                      isSelcted = SettingsScreen.id;
                      homeData.changePage(isSelcted);
                    });
                  },
                ),
                SizedBox(
                  height: kPADDING,
                ),
                DrawerListTile(
                  icon: Icons.category_outlined,
                  title: 'Categorys',
                  isSelceted: isSelcted == CategorysScreen.id ? true : false,
                  onPressed: () {
                    setState(() {
                      widget.controller.reverse();
                      isSelcted = CategorysScreen.id;
                      homeData.changePage(isSelcted);
                    });
                  },
                ),
                SizedBox(
                  height: kPADDING,
                ),
                DrawerListTile(
                  icon: Icons.message,
                  title: 'Messeges',
                  isSelceted: isSelcted == MessegesScreen.id ? true : false,
                  onPressed: () {
                    setState(() {
                      widget.controller.reverse();
                      isSelcted = MessegesScreen.id;
                      homeData.changePage(isSelcted);
                    });
                  },
                ),
                SizedBox(
                  height: kPADDING,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: kPADDING * 2 + 5),
                    child: Text(
                      'Logout',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(context, LoginScreen.id);
                  },
                )
              ],
            )),
      ),
    );
  }
}
