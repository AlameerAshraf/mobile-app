import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Constants.dart';

class DataFiled extends StatelessWidget {
  final String label;
  final String data;
  final Function onPressed;
  DataFiled({
    @required this.data,
    @required this.label,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPADDING),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontSize: 20.0,
                      ),
                ),
                Text(
                  data,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontSize: 20.0,
                        color: Theme.of(context).accentColor,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: kPADDING,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
