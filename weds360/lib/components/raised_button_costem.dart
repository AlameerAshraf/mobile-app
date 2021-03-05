import 'package:flutter/material.dart';

class RaisedButtonCustem extends StatelessWidget {
  final String title;

  final Function onPressed;
  RaisedButtonCustem({
    @required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      // padding: const EdgeInsets.only(
      //     top: 16.0, bottom: 8.0, left: 20.0, right: 20.0),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
