import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/app_localizations.dart';

class DrawerCounterView extends StatelessWidget {
  final DateTime date;

  const DrawerCounterView({
    @required this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(11),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      height: 88.0,
      width: (MediaQuery.of(context).size.width / 3) * 1.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).translate('drawer_counter_label'),
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Center(
              child: Text(
                timeleft(date),
                maxLines: 1,
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: 35.0,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String timeleft(DateTime date) {
    final now = DateTime.now();
    Duration duration = now.difference(date);
    int minutes = duration.abs().inMinutes;
    String count = _leftDays(minutes).toInt().toString() +
        ' : ' +
        _leftHours(minutes).toInt().toString() +
        ' : ' +
        _leftMinutes(minutes).toInt().toString();
    return count;
  }

  double _leftDays(int minutes) {
    return ((minutes / 60) / 24);
  }

  double _leftHours(int minutes) {
    double day = _leftDays(minutes);
    day = day - day.toInt();
    day = day * 24;
    return day;
  }

  double _leftMinutes(int minutes) {
    double day = _leftHours(minutes);
    day = day - day.toInt();
    day = day * 60;
    return day;
  }
}
