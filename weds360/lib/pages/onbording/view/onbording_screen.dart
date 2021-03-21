import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:weds360/pages/login/view/login_screen.dart';
import 'package:weds360/pages/onbording/view/raised_button_next.dart';

class OnBordingScreen extends StatefulWidget {
  static const String id = 'OnBording';

  @override
  _OnBordingScreenState createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  int selctedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black,
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
            image: AssetImage(
              '$ONBORDINGSCREENASSETS$selctedIndex.jpg',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Padding(
              padding: const EdgeInsets.all(kPADDING * 2),
              child: Image.asset(
                LOGOWHITEASSETS,
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 4,
              ),
            ),
            Expanded(
              child: PageView.builder(
                  itemCount: 3,
                  onPageChanged: (index) {
                    setState(() {
                      selctedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: kPADDING * 2),
                          child: Text(
                            AppLocalizations.of(context).translate(
                              'onbording_screen_one_label',
                            ),
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: kPADDING * 2, top: 10.0),
                            child: Text(
                              AppLocalizations.of(context).translate(
                                'onbording_screen_one_Descreption',
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(5.0, 5.0),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(kPADDING * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedSmoothIndicator(
                    activeIndex: selctedIndex,
                    count: 3,
                    // duration: Duration(milliseconds: 600),
                    effect: ExpandingDotsEffect(
                      expansionFactor: 2,
                      dotColor: Theme.of(context).scaffoldBackgroundColor,
                      activeDotColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  selctedIndex != 2
                      ? FlatButton(
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('onbording_screen_one_skip_Button'),
                            style: Theme.of(context).textTheme.button.copyWith(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                          ),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, LoginScreen.id);
                          },
                        )
                      : RaisedButtonNext(
                          title: AppLocalizations.of(context)
                              .translate('onbording_screen_one_start_Button'),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, LoginScreen.id);
                          },
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
