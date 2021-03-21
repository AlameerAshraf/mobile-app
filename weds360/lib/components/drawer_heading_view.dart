import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Constants.dart';

class DrawerHeadingView extends StatelessWidget {
  final String name;
  final String email;

  const DrawerHeadingView({
    @required this.name,
    @required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: kPADDING, top: kPADDING),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/images/alimotie.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.center),
          ),
        ),
        // SizedBox(
        //   width: kPADDING,
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
            ),
            Text(
              email,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.5),
                    fontSize: 10.0,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
