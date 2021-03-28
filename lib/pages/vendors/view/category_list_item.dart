import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Constants.dart';

class CategoryListItem extends StatelessWidget {
  final Function onPressed;
  final String image;
  final IconData icon;
  final String title;

  const CategoryListItem({
    @required this.onPressed,
    @required this.image,
    @required this.icon,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(kPADDING),
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(ROUNDED),
          ),
          image: DecorationImage(
              image: NetworkImage(image),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20.0,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Theme.of(context).accentColor,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
