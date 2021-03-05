import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weds360/components/raised_button_costem.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:weds360/pages/onbording/view/onbording_provider.dart';
import 'package:weds360/pages/onbording/view/raised_button_next.dart';

class OnBordingScreen extends StatefulWidget {
  static const String id = 'OnBording';

  @override
  _OnBordingScreenState createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  @override
  Widget build(BuildContext context) {
    final onBordingData = Provider.of<OnBordingProvider>(context);
    final imageHeaght = MediaQuery.of(context).size.height / 2;
    if (onBordingData.heaght == null) {
      onBordingData.heaghtMax = imageHeaght;
      onBordingData.heaght = imageHeaght;
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 8),
            AnimatedContainer(
                height: onBordingData.heaght,
                width: 421.0,
                duration: Duration(milliseconds: 300),
                child: Image.asset(onBordingData.iamgePath)),
            Center(
              child: Text(
                AppLocalizations.of(context)
                    .translate('onbording_screen_one_label'),
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            // SizedBox(
            //   height: kPADDING,
            // ),
            Expanded(
              child: Text(
                AppLocalizations.of(context)
                    .translate('onbording_screen_one_Descreption'),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Center(
                child: AnimatedSmoothIndicator(
              activeIndex: onBordingData.selected,
              count: onBordingData.count,
              // duration: Duration(milliseconds: 600),
              effect: ExpandingDotsEffect(
                expansionFactor: 2,
                dotColor: Theme.of(context).accentColor,
                activeDotColor: Theme.of(context).primaryColor,
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(kPADDING),
              child: onBordingData.selected == 2
                  ? RaisedButtonCustem(
                      title: AppLocalizations.of(context)
                          .translate('onbording_screen_one_start_Button'),
                      onPressed: () {
                        onBordingData.start(context);
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          child: Text(AppLocalizations.of(context)
                              .translate('onbording_screen_one_skip_Button')),
                          onPressed: () {
                            onBordingData.skip(context);
                          },
                        ),
                        RaisedButtonNext(
                          title: AppLocalizations.of(context)
                              .translate('onbording_screen_one_next_Button'),
                          onPressed: () {
                            onBordingData.next();
                          },
                        )
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
