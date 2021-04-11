import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Constants.dart';

class InvitationCounterView extends StatelessWidget {
  final String number;
  final String title;
  final Color color;

  const InvitationCounterView({
    @required this.number,
    @required this.title,
    @required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100.0,
        margin: EdgeInsets.only(top: kPADDING, right: kPADDING),
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 0.3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(ROUNDED))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: TextStyle(
                fontSize: 35,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
