import 'package:flutter/material.dart';

class RaisedButtonNext extends StatelessWidget {
  final String title;

  final Function onPressed;
  RaisedButtonNext({
    @required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60.0,
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        onPressed: onPressed,
        child: Text(
          title,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.button.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
        ),
      ),
    );
  }
}
