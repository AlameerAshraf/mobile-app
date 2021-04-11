import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/check_list_card_view.dart';
import 'package:weds360/components/tab_card_view.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/budgeter/view/budgeter_screen.dart';
import 'package:weds360/pages/guest_list/view/guest_list_screen.dart';
import 'package:weds360/pages/home/view/add_checklist_item_dialog.dart';
import 'package:weds360/pages/home/view/change_title_dialog.dart';
import 'package:weds360/pages/home/view/home_provider.dart';
import 'package:weds360/pages/home/view/profile_section_home.dart';
import 'package:weds360/pages/registry/view/registry_screen.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  double animationDuration = 0.0;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    Timer(Duration(milliseconds: 1000), () => animationController.forward());
    animationDuration = 1 / (100 * (1 / 5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kPADDING),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileSectionHome(
                  userName: 'Ali',
                  partnerName: 'Nada',
                  date: '14 September 2021'),
              Padding(
                padding: const EdgeInsets.all(kPADDING),
                child: Text(
                  'GET INSPIRATION',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 25.0,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
              Container(
                height: 125.0,
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return TabCardView(
                        imagePath:
                            'https://image.freepik.com/free-photo/indoor-portrait-young-girl-black-dress-bride-her-groom-with-rose-pocket-dancing-isolated-background_197531-16335.jpg',
                        title: 'Tax Accountant',
                        description:
                            'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',
                        onPressed: () {},
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(kPADDING),
                child: Text(
                  '360 PLANNER',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 25.0,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
              Consumer<HomeProvider>(
                builder: (context, home, _) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: home.planner.length,
                    itemBuilder: (context, index) => AnimatedBuilder(
                      animation: animationController,
                      builder: (context, _) {
                        var start = (animationDuration * index).toDouble();
                        var end = start + animationDuration;

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          home.checkListPercent();
                        });

                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(1, 0),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                              parent: animationController,
                              curve: Interval(start, end))),
                          child: CheckListCardView(
                              percent: animationController.value *
                                  home.planner[index].percent,
                              title: home.planner[index].title,
                              description: home.planner[index].description,
                              onPressed: () {
                                if (index == home.planner.length - 1) {
                                  // CheckList
                                  showModalBottomSheet(
                                      // isScrollControlled:
                                      //     true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(ROUNDED),
                                            topRight: Radius.circular(ROUNDED)),
                                      ),
                                      elevation: 5.0,
                                      context: context,
                                      builder: (context) {
                                        return checkList(index);
                                      });
                                } else if (index == 0) {
                                  // GuestList
                                  Navigator.pushNamed(
                                      context, GuestListScreen.id);
                                } else if (index == 1) {
                                  // Wedding Webstie
                                  home.launchURL('https://www.google.com/');
                                } else if (index == 2) {
                                  // Budgeter
                                  Navigator.pushNamed(
                                      context, BudgeterScren.id);
                                } else if (index == 3) {
                                  // Regestry
                                  Navigator.pushNamed(
                                      context, RegistryScreen.id);
                                }
                              }),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding checkList(int index) {
    return Padding(
        padding: const EdgeInsets.all(kPADDING),
        child: Consumer<HomeProvider>(
          builder: (context, home, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    padding: EdgeInsets.all(kPADDING),
                    iconSize: 40.0,
                    icon: Icon(
                      Icons.add_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AddCheckListItemDialog(),
                      );
                    }),
                CheckListCardView(
                  percent:
                      animationController.value * home.planner[index].percent,
                  title: home.planner[index].title,
                  description: home.planner[index].description,
                  onPressed: null,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: home.checkLists.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          value: home.checkLists[index].isSelcted,
                          onChanged: (selcted) {
                            home.onChangeCheckList(selcted, index);
                          },
                          title: Text(
                            home.checkLists[index].title,
                          ),
                          checkColor: Theme.of(context).scaffoldBackgroundColor,
                          activeColor: Theme.of(context).primaryColor,
                          controlAffinity: ListTileControlAffinity.leading,
                          secondary: Container(
                            width: 100.0,
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => ChageTitleDialog(
                                          title: home.checkLists[index].title,
                                          index: index,
                                        ),
                                      );
                                    }),
                                IconButton(
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    onPressed: () {
                                      home.onDeleteCheckList(index);
                                    }),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          },
        ));
  }
}
