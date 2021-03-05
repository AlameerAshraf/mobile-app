import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/recomended_card_view.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:weds360/pages/drawer/view/drawer_screen.dart';
import 'package:weds360/pages/home/view/home_provider.dart';
import 'package:weds360/pages/home/view/recomended_list_view.dart';
import 'package:weds360/pages/home/view/tabs_pager_view.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'Home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  bool _canBeDraged;
  bool isIgnored = false;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: kBaseSettleDuration);
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
  void toggleCancel() => animationController.reverse();

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft =
        animationController.isDismissed && details.globalPosition.dx < 10;
    bool isDragCloseFromRight =
        animationController.isCompleted && details.globalPosition.dx > 100;
    _canBeDraged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDraged) {
      double delta =
          details.primaryDelta / (MediaQuery.of(context).size.width / 2);
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.fling(velocity: -1.0);
    } else {
      animationController.fling(velocity: 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<HomeProvider>(context);

    homeData.getList(context);
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          double slide = (MediaQuery.of(context).size.width / 1.5) *
              animationController.value;
          double scale = 1 - (animationController.value * 0.2);
          return Stack(
            children: [
              DrawerScreen(),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: GestureDetector(
                    onTap: toggleCancel,
                    child: DefaultTabController(
                      length: 5,
                      child: Scaffold(
                        appBar: AppBar(
                          centerTitle: true,
                          title: Text(
                            AppLocalizations.of(context)
                                .translate('home_screen_label'),
                          ),
                          leading: IconButton(
                              icon: Icon(Icons.menu), onPressed: toggle),
                        ),
                        body: IgnorePointer(
                          ignoring:
                              animationController.isCompleted ? true : false,
                          child: homeData.recomendedModelList.isEmpty
                              ? Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : SafeArea(
                                  child: Padding(
                                    padding: const EdgeInsets.all(kPADDING),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text('Recommendations',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2),
                                        RecomenededListView(),
                                        Container(
                                          height: 50.0,
                                          child: TabBar(
                                              labelColor: Theme.of(context)
                                                  .primaryColor,
                                              unselectedLabelColor: Colors.grey,
                                              indicatorColor:
                                                  Colors.transparent,
                                              isScrollable: true,
                                              tabs: [
                                                Tab(text: "Top"),
                                                Tab(text: "Popular"),
                                                Tab(text: "Trending"),
                                                Tab(text: "pupelur"),
                                                Tab(text: "pupelur"),
                                              ]),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
                                          child: TabBarView(children: [
                                            TabsPagerView(),
                                            TabsPagerView(),
                                            TabsPagerView(),
                                            TabsPagerView(),
                                            TabsPagerView(),
                                          ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
