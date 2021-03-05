import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  const RoundedIconButton({
    @required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            icon,
          ),
          onPressed: onPressed,
          iconSize: 15.0,
        ),
      ),
    );
  }
}
