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
        height: 60.0,
        width: 100.0,
        // padding: const EdgeInsets.only(
        //     top: 16.0, bottom: 8.0, left: 20.0, right: 20.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          onPressed: onPressed,
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ));
  }
}
