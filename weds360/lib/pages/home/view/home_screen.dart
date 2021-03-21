import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weds360/components/check_list_card_view.dart';
import 'package:weds360/components/tab_card_view.dart';
import 'package:weds360/core/helpers/Constants.dart';

import 'package:weds360/pages/blog/view/blog_screen.dart';
import 'package:weds360/pages/drawer/view/drawer_screen.dart';
import 'package:weds360/pages/home/view/Homes_page_body.dart';
import 'package:weds360/pages/home/view/add_checklist_item_dialog.dart';
import 'package:weds360/pages/home/view/change_title_dialog.dart';
import 'package:weds360/pages/home/view/home_provider.dart';
import 'package:weds360/pages/home/view/profile_section_home.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'Home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController2;
  bool _canBeDraged;
  bool isIgnored = false;
  @override
  void initState() {
    animationController2 =
        AnimationController(vsync: this, duration: kBaseSettleDuration);
    super.initState();
  }

  void toggle() => animationController2.isDismissed
      ? animationController2.forward()
      : animationController2.reverse();
  void toggleCancel() => animationController2.reverse();

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft =
        animationController2.isDismissed && details.globalPosition.dx < 10;
    bool isDragCloseFromRight =
        animationController2.isCompleted && details.globalPosition.dx > 100;
    _canBeDraged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDraged) {
      double delta =
          details.primaryDelta / (MediaQuery.of(context).size.width / 2);
      animationController2.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (animationController2.isDismissed || animationController2.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      animationController2.fling(velocity: visualVelocity);
    } else if (animationController2.value < 0.5) {
      animationController2.fling(velocity: -1.0);
    } else {
      animationController2.fling(velocity: 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<HomeProvider>(context);
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: animationController2,
        builder: (context, _) {
          double slide = (MediaQuery.of(context).size.width / 1.5) *
              animationController2.value;
          double scale = 1 - (animationController2.value * 0.2);
          return Stack(
            children: [
              DrawerScreen(
                controller: animationController2,
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    animationController2.value == 1 ? 15 : 0.0,
                  ),
                  child: GestureDetector(
                      onTap: toggleCancel,
                      child: Scaffold(
                        appBar: AppBar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          // toolbarHeight: 100.0,
                          elevation: 0.0,
                          leading: IconButton(
                            icon: Icon(
                              Icons.menu_rounded,
                              color: Theme.of(context).primaryColor,
                              size: 35.0,
                            ),
                            onPressed: toggle,
                          ),
                          actions: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: kPADDING, top: kPADDING),
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 5.0,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/alimotie.jpg'),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ],
                        ),
                        body: IgnorePointer(
                          ignoring:
                              animationController2.isCompleted ? true : false,
                          child: homeData.currentPage(),
                        ),
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    animationController2.dispose();
    super.dispose();
  }
}
