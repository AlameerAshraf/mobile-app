import 'package:flutter/material.dart';

class ProgressWithCenteredValue extends StatelessWidget {
  final double percent;
  const ProgressWithCenteredValue({
    @required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80.0,
          height: 90.0,
          child: CircularProgressIndicator(
            value: percent,
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            strokeWidth: 4.0,
          ),
        ),
        Container(
          width: 80.0,
          height: 90.0,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '${(percent * 100).toInt()} %',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
