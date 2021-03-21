import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final Color color;

  const RoundedIconButton({
    @required this.icon,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: IconButton(
            padding: EdgeInsets.zero,
            color: Theme.of(context).scaffoldBackgroundColor,
            icon: Icon(
              icon,
            ),
            onPressed: onPressed,
            iconSize: 25.0,
          ),
        ),
      ),
    );
  }
}
