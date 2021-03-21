import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelceted;
  final Function onPressed;

  const DrawerListTile({
    @required this.icon,
    @required this.title,
    @required this.isSelceted,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.0,
      height: 60.0,
      margin: EdgeInsets.only(right: 170.0),
      decoration: BoxDecoration(
        color: isSelceted
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelceted
              ? Theme.of(context).primaryColor
              : Theme.of(context).scaffoldBackgroundColor,
          size: 30.0,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline2.copyWith(
                color: isSelceted
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
