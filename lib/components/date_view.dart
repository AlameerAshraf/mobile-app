import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Constants.dart';

class DataView extends StatelessWidget {
  final String day;
  final String mounth;

  const DataView({
    @required this.day,
    @required this.mounth,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 130.0,
      margin: EdgeInsets.only(right: kPADDING),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(ROUNDED),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            day,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 70.0,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
          Text(
            mounth,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 35.0,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
        ],
      ),
    );
  }
}
